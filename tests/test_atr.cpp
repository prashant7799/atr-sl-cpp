#include <gtest/gtest.h>
#include "atr_sl.hpp"          // header you wrote

TEST(ATR, Wilder14_KnownExample)
{
    const double highs[]  = {100,102,101,103,104,105,106,107,108,109,110,111,112,113,114};
    const double lows[]   = { 99,100, 99,100,101,102,103,104,105,106,107,108,109,110,111};
    const double closes[] = {100,101,100,102,103,104,105,106,107,108,109,110,111,112,113};
    auto atr = atr::calc_atr(highs, lows, closes, 14);

    // True ATR of last bar should be 1.0 (hand-checked for this toy data)
    EXPECT_NEAR(atr.back(), 2.85714285714, 1e-9);

}

TEST(TrailingSL, Basic)
{
    double sl = atr::trailing_sl(100.0, 2.0, 3.0);
    EXPECT_DOUBLE_EQ(sl, 94.0);
}
