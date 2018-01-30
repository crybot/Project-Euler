using System;

namespace ES3
{
  class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine(evenFib(1, 2));
			Console.ReadKey();
		}

		public static int evenFib(int i0, int i1)
		{
			int sum;
			if (i1 > 4000000)
				return 0;

			sum = i1 + evenFib(i1*2 + i0, i1*3 + i0*2);
			return sum;
		}
	}
}
