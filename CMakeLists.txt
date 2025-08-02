cmake_minimum_required(VERSION 3.20)

project(atr_sl LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --- Conan-generated package files ----
#   *build/generators/* are created by `conan install`
find_package(GTest REQUIRED CONFIG)

# ------------- Library ----------------
add_library(atr_sl src/atr_sl.cpp)
target_include_directories(atr_sl PUBLIC include)

# ------------- Tests ------------------
enable_testing()

add_executable(atr_tests tests/test_atr.cpp)
target_link_libraries(atr_tests
    PRIVATE atr_sl                      # your lib
            GTest::gtest                # <- exact spelling / case
            GTest::gtest_main)

add_test(NAME RunAll COMMAND atr_tests)
