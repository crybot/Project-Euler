using System;
using System.Numerics;

namespace ES16
{
  class MainClass
	{
		public static void Main (string[] args)
		{
			BigInteger bigInt = BigInteger.Pow (2, 1000);

			int sum = 0;
			foreach (char c in bigInt.ToString()) {
				sum += int.Parse(c.ToString());
			}

			Console.Write(sum);
		}
	}
}
