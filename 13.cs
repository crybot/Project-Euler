using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
namespace ES12
{
  class MainClass
	{
		public static void Main (string[] args)
		{
			string[] tokens = File.ReadAllLines (@"file.txt");
		
			Stack<int> sum = new Stack<int> ();
            
			int carry = 0;
			int digitSum;
			for (int i=0; i<50; i++) {
				digitSum = carry;
				carry = 0;
				foreach (string num in tokens) {
					digitSum += int.Parse (num[num.Length - i - 1].ToString ());
				}


				carry = digitSum / 10;

				sum.Push(digitSum % 10);
			}
           
			foreach (int n in sum) {
				Console.Write(n);
			}
		}
	}
}
