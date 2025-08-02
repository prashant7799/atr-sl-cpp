########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(atr_sl_FIND_QUIETLY)
    set(atr_sl_MESSAGE_MODE VERBOSE)
else()
    set(atr_sl_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/atr_slTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${atr_sl_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(atr_sl_VERSION_STRING "1.0")
set(atr_sl_INCLUDE_DIRS ${atr_sl_INCLUDE_DIRS_RELEASE} )
set(atr_sl_INCLUDE_DIR ${atr_sl_INCLUDE_DIRS_RELEASE} )
set(atr_sl_LIBRARIES ${atr_sl_LIBRARIES_RELEASE} )
set(atr_sl_DEFINITIONS ${atr_sl_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${atr_sl_BUILD_MODULES_PATHS_RELEASE} )
    message(${atr_sl_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


