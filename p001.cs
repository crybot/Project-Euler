using System;

namespace ES1
{
  class MainClass
	{
		public static void Main (string[] args)
		{
			int upTo = 1000-1;
			int t1 = upTo / 3;
			int t2 = upTo / 5;
			int t3 = upTo / 15;

			int s1 = t1 * (3 + t1*3)/2;
			int s2 = t2 * (5 + t2*5)/2;
			int s3 = t3 * (15 + t3*15)/2;

			Console.WriteLine(s1 + s2 - s3);

		}

		public static int SumUpTo(int N)
		{
			return N*(N + 1)/2;
		}
	}
}
