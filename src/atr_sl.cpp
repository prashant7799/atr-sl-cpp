#include "atr_sl.hpp"
#include <algorithm>   // std::max
#include <cassert>     // assert
#include <cmath>       // std::abs

namespace {   // unnamed namespace = private helpers

// Calculate “True Range” for one bar
inline double true_range(double high,
                         double low,
                         double prev_close)
{
    double v1 = high - low;
    double v2 = std::abs(high - prev_close);
    double v3 = std::abs(low  - prev_close);
    return std::max({v1, v2, v3});
}

} // unnamed

namespace atr {

std::vector<double>
calc_atr(std::span<const double> highs,
         std::span<const double> lows,
         std::span<const double> closes,
         int period)
{
    size_t n = highs.size();
    assert(lows.size() == n && closes.size() == n);
    assert(period > 0 && n >= static_cast<size_t>(period + 1));

    std::vector<double> out(n, 0.0);

    // 1) seed with simple moving average of the first “period” true-ranges
    double sum_tr = 0.0;
    for (int i = 1; i <= period; ++i)
        sum_tr += true_range(highs[i], lows[i], closes[i - 1]);

    out[period] = sum_tr / period;

    // 2) Wilder’s smoothing formula for the rest
    for (size_t i = period + 1; i < n; ++i) {
        double tr = true_range(highs[i], lows[i], closes[i - 1]);
        out[i] = (out[i - 1] * (period - 1) + tr) / period;
    }
    return out;
}

} // namespace atr
