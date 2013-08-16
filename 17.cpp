#include <iostream>
using namespace std;

int main()
{
    string units = "onetwothreefourfivesixseveneightnine";
    string aboveTen = "teneleventwelvethirteenfourteenfifteensixteenseventeeneighteennineteen";
    string tens = "twentythirtyfortyfiftysixtyseventyeightyninety";
    string hundred = "hundred";
    string thousand = "thousand";
    string AND = "and";

    int to99 = units.size()*9 + aboveTen.size() + (tens.size() * 10);

    int to999 = units.size()*100 + hundred.size()*100*9 + AND.size()*99*9 + to99*10;

    int to1000 = to999 + char_traits<char>::length("one") + thousand.size();

    cout << to1000 << endl;

    return 0;
}
