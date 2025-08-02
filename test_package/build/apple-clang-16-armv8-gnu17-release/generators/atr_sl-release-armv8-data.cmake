########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(atr_sl_COMPONENT_NAMES "")
if(DEFINED atr_sl_FIND_DEPENDENCY_NAMES)
  list(APPEND atr_sl_FIND_DEPENDENCY_NAMES GTest benchmark)
  list(REMOVE_DUPLICATES atr_sl_FIND_DEPENDENCY_NAMES)
else()
  set(atr_sl_FIND_DEPENDENCY_NAMES GTest benchmark)
endif()
set(GTest_FIND_MODE "NO_MODULE")
set(benchmark_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(atr_sl_PACKAGE_FOLDER_RELEASE "/Users/prashantlohar/.conan2/p/b/atr_s6e8c6fac6d7ed/p")
set(atr_sl_BUILD_MODULES_PATHS_RELEASE )


set(atr_sl_INCLUDE_DIRS_RELEASE "${atr_sl_PACKAGE_FOLDER_RELEASE}/include")
set(atr_sl_RES_DIRS_RELEASE )
set(atr_sl_DEFINITIONS_RELEASE )
set(atr_sl_SHARED_LINK_FLAGS_RELEASE )
set(atr_sl_EXE_LINK_FLAGS_RELEASE )
set(atr_sl_OBJECTS_RELEASE )
set(atr_sl_COMPILE_DEFINITIONS_RELEASE )
set(atr_sl_COMPILE_OPTIONS_C_RELEASE )
set(atr_sl_COMPILE_OPTIONS_CXX_RELEASE )
set(atr_sl_LIB_DIRS_RELEASE "${atr_sl_PACKAGE_FOLDER_RELEASE}/lib")
set(atr_sl_BIN_DIRS_RELEASE )
set(atr_sl_LIBRARY_TYPE_RELEASE STATIC)
set(atr_sl_IS_HOST_WINDOWS_RELEASE 0)
set(atr_sl_LIBS_RELEASE atr_sl)
set(atr_sl_SYSTEM_LIBS_RELEASE )
set(atr_sl_FRAMEWORK_DIRS_RELEASE )
set(atr_sl_FRAMEWORKS_RELEASE )
set(atr_sl_BUILD_DIRS_RELEASE )
set(atr_sl_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(atr_sl_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${atr_sl_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${atr_sl_COMPILE_OPTIONS_C_RELEASE}>")
set(atr_sl_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${atr_sl_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${atr_sl_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${atr_sl_EXE_LINK_FLAGS_RELEASE}>")


set(atr_sl_COMPONENTS_RELEASE )