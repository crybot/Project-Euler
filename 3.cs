using System;
using System.Diagnostics;

namespace ES4
{
  class MainClass
	{
		public static ulong[] Primes = new ulong[1000000];
		public static ulong max = 7;
		public static int index = 3;

		public static void Main (string[] args)
		{
			Stopwatch watch = new Stopwatch();

			Primes [0] = 2;
			Primes [1] = 3;
			Primes [2] = 5;
			Primes [3] = 7;

			watch.Start();

			PrintFactors(60085147514373);

			watch.Stop();
			Console.WriteLine("\nElapsed Time: {0}", watch.ElapsedMilliseconds);
			Console.ReadKey();
		}

		public static void PrintFactors (ulong num)
		{
			for (ulong p = 2; p <= num; p = GenerateNextPrime(p)) {
				if (num % p == 0) {
					Console.WriteLine("{0} % {1} = 0", num, p);
					PrintFactors (num / p);
					break;
				}
			}
		}

		public static ulong GenerateNextPrime (ulong curr)
		{
			bool found = false;
			ulong p = curr;

			if (p == 2)
				return 3;

			while (!found) {
				p += 2;

				found = true;

				int i = 1;
				ulong prime;

				while ((prime = Primes[i++])*prime <= p && found && i < index) {
					if (p % prime == 0)
						found = false;
				}
			}

			if (p > max) {
				max = p;
				Primes[++index] = p;
			}

			return p;
		}
	}
}
