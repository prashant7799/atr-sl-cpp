# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/atr_sl-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${atr_sl_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${atr_sl_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET atr_sl::atr_sl)
    add_library(atr_sl::atr_sl INTERFACE IMPORTED)
    message(${atr_sl_MESSAGE_MODE} "Conan: Target declared 'atr_sl::atr_sl'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/atr_sl-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()