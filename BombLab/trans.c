#include <stdio.h>
int main()
{
    unsigned char s[] = {9, 15, 14, 5, 6, 7};
    for (int i = 0; i < 6; ++i)
        putchar(s[i] + '@');
}