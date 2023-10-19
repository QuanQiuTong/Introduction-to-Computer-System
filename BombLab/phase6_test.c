#include <stdio.h>
#include <stdlib.h>
__BYTE_ORDER__;
_Noreturn void explode_bomb(int a1, ...)
{
    puts("\nBOOM!!!");
    puts("The bomb has blown up.");
    exit(8);
}

#define __int64 long long
typedef unsigned char BYTE;
typedef int _DWORD;
typedef long long QWORD;
// 0x6032d0:
BYTE node[][16] = {{0x4c, 01, 00, 00, 01, 00, 00, 00, 0x0e0, 0x32, 0x60, 00, 00, 00, 00, 00},
                   {0x0a8, 00, 00, 00, 02, 00, 00, 00, 0x0f0, 0x32, 0x60, 00, 00, 00, 00, 00},
                   {0x9C, 0x03, 00, 00, 03, 00, 00, 00, 00, 0x33, 0x60, 00, 00, 00, 00, 00},
                   {0xB3, 02, 00, 00, 04, 00, 00, 00, 0x10, 0x33, 0x60, 00, 00, 00, 00, 00},
                   {0xDD, 01, 00, 00, 05, 00, 00, 00, 0x20, 0x33, 0x60, 00, 00, 00, 00, 00},
                   {0xBB, 01, 00, 00, 06, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00},
                   {0}};
void phase_6(__int64 a1)
{
    unsigned __int64 i; // rsi
    __int64 j;          // rcx
    int a[6];           // [rsp+0h] [rbp-78h] BYREF
    __int64 v17;        // [rsp+20h] [rbp-58h]
    char v18;           // [rsp+28h] [rbp-50h] BYREF
    char v19[40];       // [rsp+50h] [rbp-28h] BYREF
    unsigned char rsp[0x78];

    if (scanf("%d %d %d %d %d %d", a, a + 1, a + 2, a + 3, a + 4, a + 5) <= 5)
        explode_bomb(a1);
    // test if the 6 numbers are a permutation of 1,2,3,4,5,6.
    {
        int cnt /* %r12d */ = 0;
        for (int *v1 = a;; ++v1)
        {
            if (*v1 - 1u > 5)
                explode_bomb(a1, a);
            if (++cnt == 6)
                break;
            int v3 = cnt;
            do
            {
                if (*v1 == a[v3])
                    explode_bomb(a1, a);
                ++v3;
            } while (v3 <= 5);
        }
    }

    // modify a[i] to 7 - a[i].
    for (int *p = a; p != a + 6; ++p)
        *p = 7 - *p;
    // still a permutation.

    for (i = 0LL; i != 24; i += 4LL)
    { // 0x401197：
        int ecx = a[i / 4];
        BYTE *rdx;
        if (ecx <= 1)
        { // 0x401183:
            rdx /*edx*/ = node[0];
        }
        else
        { // 0x40119f:
            int eax = 1;
            rdx /*edx*/ = node[0];
            do
            { // 0x401176:
                rdx = *(QWORD *)(rdx + 8);
                ++eax;
            } while (eax != ecx);
        }
        // 0x401188:
        *(__int64 *)(0x20 + rsp + 2 * i) = (__int64)rdx;
    }
    // 0x4011ab:
    QWORD rbx = *(QWORD *)(rsp + 0x20);
    char *rax = (rsp + 0x28);
    QWORD rsi = (rsp + 0x50);
    QWORD rdx;
    for (j = v17;; j = rdx)
    { // 0x4011bd:
        rdx = *(QWORD *)rax;
        *(QWORD *)(j + 8) = *(QWORD *)rax;
        rax += 8;
        if (rax == v19)
            break;
    }
    // 0x4011d2:
    *(QWORD *)(rdx + 8) = 0LL;
    int ebp = 5;
    do
    { // 0x4011df:
        QWORD rax = **(unsigned int **)(rbx + 8);
        if (*(_DWORD *)rbx < (int)rax)
            explode_bomb(a1, v19);
        // 0x4011ee:
        rbx = *(QWORD *)(rbx + 8);
        --ebp;
    } while (ebp);
}
int main()
{
    phase_6(1);
}