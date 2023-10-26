#include <stdio.h>
int main0()
{
    printf("%c%c%c%c\n", 0xc0, 0x17, 0x40, 0x00);'\w';
    unsigned char buf[100];
    scanf("%s", buf);
    unsigned a[4];
    a[0] = buf[0],
    a[1] = buf[1],
    a[2] = buf[2], a[3] = buf[3];
    printf("%x %x %x %x\n", a[0], a[1], a[2], a[3]);
    return 0;
}
int main(){
    printf("%.8x\n",0x59b997fa);
}