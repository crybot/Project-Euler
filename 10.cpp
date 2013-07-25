#ifndef PRIMEGENERATOR_H
#define PRIMEGENERATOR_H
#include <cmath>
#include <iostream>
#include <exception>
#include <vector>

const unsigned int g_DEFAULT_SIZE = 1000000;

template<class Sieve = std::vector<bool>, class SizeT = int>
class PrimeGenerator
{
public:
    typedef std::vector<SizeT> PrimeList;
    typedef typename PrimeList::iterator iterator;

    PrimeGenerator(SizeT = g_DEFAULT_SIZE);

    void GeneratePrimes(SizeT, bool);
    void PrintPrimes();

    SizeT GetNthPrime(SizeT);

    iterator Begin() {
        return m_primeList.begin();
    }
    iterator End() {
        return m_primeList.end();
    }

private:
    void factorize();

    PrimeList m_primeList;
    Sieve m_sieve;
    SizeT m_size;
    SizeT m_listSize;

};

template<class Sieve, class SizeT>
PrimeGenerator<Sieve, SizeT>::PrimeGenerator(SizeT size)
    :m_size(size + 1)
{
    m_sieve = Sieve(m_size, 0);
    m_listSize = m_size;
    factorize();
}

template<class Sieve, class SizeT>
void PrimeGenerator<Sieve, SizeT>::factorize()
{
    SizeT c = 2;
    m_sieve[2] = 1;
    m_sieve[3] = 1;

    for (SizeT i=5; i<m_size; i += c, c = 6 - c)
        m_sieve[i] = 1;
}

template<class Sieve, class SizeT>
void PrimeGenerator<Sieve, SizeT>::GeneratePrimes(SizeT upTo, bool savePrimes)
{
    register SizeT c = 2;
    register SizeT max = std::sqrt(upTo);

    for (register SizeT i=5; i<=max; i += c, c = 6 - c)
    {
        if (m_sieve[i])
        {
            for (register SizeT k = i*i; k<=upTo; k += i)
            {
                m_sieve[k] = 0;
            }
        }
    }

    if (savePrimes)
    {
        SizeT i;

        if (m_primeList.size() == 0)
        {
            m_primeList.push_back(2);
            m_primeList.push_back(3);
            i = 5;
        }
        else
        {
            i = m_primeList[m_primeList.size() -1] + 2;
        }

        for ( ; i<=upTo; i++)
        {
            if (m_sieve[i])
                m_primeList.push_back(i);
        }
    }
}

template<class Sieve, class SizeT>
SizeT PrimeGenerator<Sieve, SizeT>::GetNthPrime(SizeT n)
{
    return m_primeList.at(n - 1);
}

template<class Sieve, class SizeT>
void PrimeGenerator<Sieve, SizeT>::PrintPrimes()
{
    for (iterator it = m_primeList.begin(); it != m_primeList.end(); ++it)
    {
        std::cout << *it << std::endl;
    }
}

#endif // PRIMEGENERATOR_H

int main()
{
    const int N = 10000000;
    long sum = 0;

    typedef PrimeGenerator<std::vector<bool>, int> Generator;

    Generator generator(N);
    generator.GeneratePrimes(N, true);

    for (Generator::iterator it = generator.Begin(); it != generator.End(); ++it)
    {
        sum += *it;
    }

    std::cout << sum << std::endl;

    return 0;
}
