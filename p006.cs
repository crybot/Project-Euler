using System;

namespace ES6
{
  class MainClass
	{
		public static void Main (string[] args)
		{
			int x = 0;
			int y = (int)Math.Pow(SumUpTo(100), 2);

			for (int i=1; i<=100; i++) {
				x += (int)Math.Pow(i, 2);
			}
			
			Console.WriteLine(y - x);
		}

		public static int SumUpTo(int N)
		{
			return N*(N + 1)/2;
		}
	}
}
