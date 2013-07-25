#include <iostream>
#include <cmath>

int main()
{
    /*
     * 1: a^2 + b^2 = c^2
     * 2: a < b < c
     * 3: a + b + c = 1000
     *
     *  a = m^2 - n^2
     *  b = 2mn
     *  c = m^2 + n^2
     *
     *  3:  m^2 - n^2 + 2mn + m^2 + n^2 = 1000
     *      2m^2 + 2mn = 1000
     *      m^2 + mn = 500
     *      m(m + n) = 20*25
     *      m = 20
     *      n = 25 - m = 5
     */

    int m = 20, n = 5;

    int a = std::pow(m,2) - std::pow(n, 2);
    int b = 2*m*n;
    int c = std::pow(m, 2) + std::pow(n, 2);

    std::cout << a*b*c << std::endl;

}
