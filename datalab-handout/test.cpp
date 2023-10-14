
#include <iostream>
#include <iomanip>
using namespace std;
int main()
{
    int i = 0x1;
    float f = *(float *)&i;
    f *= 4;
    // cout.precision(24);
    cout << *(int *)&f;
}