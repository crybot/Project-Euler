using System;

namespace ES5
{
  class MainClass
	{
		public static void Main (string[] args)
		{
			// the only primes p that maintain the equation p^2 <= 20 are 2 a 3.
			int x = 2, y = 3;

			// so the final number will be:
			long R = 5 * 7 * 11 * 13 * 17 * 19; // * x^a * y^b

			// we search the highest power <= 20 of 2 and 3
			for (int i=4; i<=20; i++) {
				if (i % (x * 2) == 0)
					x *= 2;
				if (i % (y * 3) == 0)
					y *= 3;
			}

			R *= x * y;

			Console.WriteLine (R);
		}
	}
}
