using System;
using System.Diagnostics;
 
namespace ES4
{
  class MainClass
	{
		public static void Main (string[] args)
		{
			int num = 0;
			int max = 0;
			int m = 0, n = 0;
			int digits = 5;
 
			// m * floor(end / m)
			int end = (int)Math.Pow (10, digits) - 1;
			int start = (int)Math.Pow (10, digits - 1);
 
			for (int i=end; i>=start; i--) {
				for (int l=11 * (end / 11); l>=start; l-=11) {
					num = i * l;
					if (num > max) {
						if (IsPalindrome (num.ToString ())) {
							max = num;
							m = i;
							n = l;
						}
					}
				}               
			}
 
 
 
			Console.WriteLine ("{0} x {1} = {2}", m, n, max);
		}
 
		public static bool IsPalindrome (string str)
		{
			for (int i=0; i<str.Length/2; i++) {
				if (str [i] != str [str.Length - i - 1])
					return false;
			}
 
			return true;
		}
	}
}
