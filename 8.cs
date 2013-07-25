using System;

namespace ES8
{
  class MainClass
	{
		public static void Main (string[] args)
		{
			string BigNum="731671765313306249192251196744265747423553491949349" +
				"69835203127745063262395783180169848018694788518438586156078911" +
				"29494954595017379583319528532088055111254069874715852386305071" +
				"56932909632952274430435576689664895044524452316173185640309871" +
				"11217223831136222989342338030813533627661428280644448664523874" +
				"93035890729629049156044077239071381051585930796086670172427121" +
				"883998797908792274921901699720888093776657273330010533678812202" +
				"354218097512545405947522435258490771167055601360483958644670632" +
				"441572215539753697817977846174064955149290862569321978468622482" +
				"839722413756570560574902614079729686524145351004748216637048440" +
				"319989000889524345065854122758866688116427171479924442928230863" +
				"465674813919123162824586178664583591245665294765456828489128831" +
				"426076900422421902267105562632111110937054421750694165896040807" +
				"19840385096245544436298123098787992724428490918884580156166097" +
				"9191338754992005240636899125607176060588611646710940507754100225" +
				"698315520005593572972571636269561882670428252483600823257530420" +
				"752963450";


			int max=1;

			// first product of 5 consecutive digits
			foreach (char num in BigNum.Substring(0, 5))
			{
				max *= int.Parse (num.ToString ());
			}

			int firstDigit = int.Parse(BigNum [0].ToString ());
			int product = max;
			bool knownProduct = true;

			for (int i=1; i<=BigNum.Length - 5; i++) 
			{
				string digits = BigNum.Substring(i, 5);
				// if the 5 digits sequence contains a 0 we skip that sequence
				if (digits.Contains("0"))
				{
					i += digits.LastIndexOf('0'); // we move to the digit next to the last 0 in the sequence
					knownProduct = false; // we have to calculate the new product
				} 
				else 
				{
					if (knownProduct)
					{
						int lastDigit = int.Parse(BigNum[i + 4].ToString());
						product = (product / firstDigit) * lastDigit;
					}
					else
					{
						product = 1;
						foreach(char num in digits)
						{
							product *= int.Parse(num.ToString());
						}

						knownProduct = true;
					}
					firstDigit = int.Parse(BigNum[i].ToString());

					if (product > max)
						max = product;
				}

			}

			Console.WriteLine (max);
		}
	}
}
