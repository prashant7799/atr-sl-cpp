#include "atr_sl.h"
#include <vector>
#include <string>

int main() {
    atr_sl();

    std::vector<std::string> vec;
    vec.push_back("test_package");

    atr_sl_print_vector(vec);
}
