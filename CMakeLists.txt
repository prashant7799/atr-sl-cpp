cmake_minimum_required(VERSION 3.20)

project(atr_sl LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ── Tell CMake where Conan put the packages ───────────
find_package(GTest REQUIRED CONFIG)
find_package(benchmark REQUIRED CONFIG)      #  ←  add this line

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

# ---------- Benchmarks ----------
add_executable(bench_atr bench/bench_atr.cpp)
target_link_libraries(bench_atr PRIVATE atr_sl benchmark::benchmark_main)
