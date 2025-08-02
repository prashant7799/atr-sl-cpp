# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(atr_sl_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(atr_sl_FRAMEWORKS_FOUND_RELEASE "${atr_sl_FRAMEWORKS_RELEASE}" "${atr_sl_FRAMEWORK_DIRS_RELEASE}")

set(atr_sl_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET atr_sl_DEPS_TARGET)
    add_library(atr_sl_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET atr_sl_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${atr_sl_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${atr_sl_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:gtest::gtest;benchmark::benchmark_main>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### atr_sl_DEPS_TARGET to all of them
conan_package_library_targets("${atr_sl_LIBS_RELEASE}"    # libraries
                              "${atr_sl_LIB_DIRS_RELEASE}" # package_libdir
                              "${atr_sl_BIN_DIRS_RELEASE}" # package_bindir
                              "${atr_sl_LIBRARY_TYPE_RELEASE}"
                              "${atr_sl_IS_HOST_WINDOWS_RELEASE}"
                              atr_sl_DEPS_TARGET
                              atr_sl_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "atr_sl"    # package_name
                              "${atr_sl_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${atr_sl_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET atr_sl::atr_sl
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${atr_sl_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${atr_sl_LIBRARIES_TARGETS}>
                 )

    if("${atr_sl_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET atr_sl::atr_sl
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     atr_sl_DEPS_TARGET)
    endif()

    set_property(TARGET atr_sl::atr_sl
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${atr_sl_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET atr_sl::atr_sl
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${atr_sl_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET atr_sl::atr_sl
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${atr_sl_LIB_DIRS_RELEASE}>)
    set_property(TARGET atr_sl::atr_sl
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${atr_sl_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET atr_sl::atr_sl
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${atr_sl_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(atr_sl_LIBRARIES_RELEASE atr_sl::atr_sl)
