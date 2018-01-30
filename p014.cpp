#include <iostream>
#include <vector>
#include <unordered_map>

using namespace std;

const long N = 1000000;
unordered_map<long, int> countTable; // stores already counted chains

int f(long n)
{
    if (n == 1)
        return 1;

    long length;

    if (countTable[n])
        return countTable[n];

    if (!(n & 1))
        length = f(n/2);
    else
        length = f((3*n+1)/2) + 1;

    if (!countTable[n])
        countTable[n] = ++length;

    return length;
}

int main()
{
    int max = 1;
    int bestStart = 1;

    for (int start=1; start<N; start+=2)
    {
        long count;

        count = f(start);

        if (count > max)
        {
            max = count;
            bestStart = start;
        }
    }

    cout << bestStart << endl;

}
