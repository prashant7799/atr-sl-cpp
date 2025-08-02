#include <benchmark/benchmark.h>
#include "atr_sl.hpp"

// Benchmark ATR on 10 k bars
static void BM_ATR(benchmark::State& state)
{
    const int N = 10'000;
    std::vector<double> highs(N, 101.0);
    std::vector<double> lows (N,  99.0);
    std::vector<double> closes(N, 100.0);

    for (auto _ : state) {
        benchmark::DoNotOptimize(
            atr::calc_atr(highs, lows, closes, 14));
    }
}
BENCHMARK(BM_ATR);
BENCHMARK_MAIN();

