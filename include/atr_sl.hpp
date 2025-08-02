#pragma once
#include <span>
#include <vector>

namespace atr {

/**
 * Wilder’s Average True Range (ATR).
 *
 * highs, lows, closes – same length, one element per candle
 * period              – typical value is 14
 *
 * Returns a vector<double> the same length as the input arrays.
 * Elements 0 … period-1 are left as 0 because ATR is undefined there.
 */
std::vector<double>
calc_atr(std::span<const double> highs,
         std::span<const double> lows,
         std::span<const double> closes,
         int period);

/**
 * Very simple trailing-stop helper
 * stop = close − k × ATR   (k is usually 2 or 3)
 */
inline double trailing_sl(double close,
                          double atr,
                          double k = 3.0)
{
    return close - k * atr;
}

}  // namespace atr
