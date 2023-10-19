#include <stdio.h>
constexpr int isAsciiDigit(int x)
{
    int zero_to_seven = (x & 0x38) ^ 0x30;
    int eight = x ^ 0x38;
    int nine = x ^ 0x39;
    return !(zero_to_seven & eight & nine);
}
int foo(int x) { return !(~x + 57 + 1 >> 31); }
int bar(int x)
{
    return (x + ~58 + 1) >> 31 & 1;
}
int foobar(int x)
{
    int sign = x >> 31;
    return x = (sign & ~x) | (~sign & x);
}
int barfoo(int x)
{
    return x ^ (x << 1);
}
int main()
{
    // for(int i='0';i<='9';++i)printf("%c: %d\n",i,isAsciiDigit(i));
    for (int i = 0; i < 255; ++i)
        printf("%d: %d %d\n", i - 128, foobar(i - 128), barfoo(i - 128));
}