#include <stdio.h>
#include <stdlib.h>
#include <stdnoreturn.h>
#define __int64 long long
typedef unsigned char BYTE;
typedef int _DWORD;
typedef long long QWORD;

noreturn void explode_bomb()
{
    puts("\nBOOM!!!");
    puts("The bomb has blown up.");
    exit(8);
}
void read_six_numbers(int input, int v[])
{
    int res = scanf("%d %d %d %d %d %d", v, v + 1, v + 2, v + 3, v + 4, v + 5);
    if (res <= 5)
        explode_bomb(input);
}

// 0x6032d0:
BYTE node[][16] = {{0x4c, 01, 00, 00, 01, 00, 00, 00, 0xe0, 0x32, 0x60, 00, 00, 00, 00, 00},
                   {0xa8, 00, 00, 00, 02, 00, 00, 00, 0xf0, 0x32, 0x60, 00, 00, 00, 00, 00},
                   {0x9C, 03, 00, 00, 03, 00, 00, 00, 00, 0x33, 0x60, 00, 00, 00, 00, 00},
                   {0xB3, 02, 00, 00, 04, 00, 00, 00, 0x10, 0x33, 0x60, 00, 00, 00, 00, 00},
                   {0xDD, 01, 00, 00, 05, 00, 00, 00, 0x20, 0x33, 0x60, 00, 00, 00, 00, 00},
                   {0xBB, 01, 00, 00, 06, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00},
                   {0}};
QWORD node[][2] = {{0x000000010000014c, 0x00000000006032e0},
                   {0x00000002000000a8, 0x00000000006032f0},
                   {0x000000030000039c, 0x0000000000603300},
                   {0x00000004000002b3, 0x0000000000603310},
                   {0x00000005000001dd, 0x0000000000603320},
                   {0x00000006000001bb, 0x0000000000000000}};
char rsp[0x78];
void phase_6(char *input)
{
    int arr[6]; // [rsp+0h] [rbp-78h] BYREF
    read_six_numbers(input, arr);
    // test if the 6 numbers are a permutation of 1,2,3,4,5,6.
    {
        int cnt /* %r12d */ = 0;
        for (int *p = arr;; ++p)
        { // 0x401114:
            if (*p - 1u > 5)
                explode_bomb();
            if (++cnt == 6)
                break;
            int _j = cnt;
            do
            { // 0x401135:
                if (*p == arr[_j])
                    explode_bomb();
                ++_j;
            } while (_j <= 5);
        }
    }
    // modify v[i] to 7 - v[i].
    {
        int *p /*rax*/ = arr;
        do
        { // 0x401160:
            *(_DWORD *)p = 7 - *(_DWORD *)p;
            p++;
        } while (p != arr + 6);
    }
    QWORD *rsp_0x20;
    for (int i = 0; i != 6; ++i)
    {
        QWORD *rdx = node[0];
        for (int j = 1; j != arr[i]; ++j)
            rdx = (QWORD *)rdx[1];
        rsp_0x20[i] = (QWORD)rdx;
    }
    // 0x4011ab:
    // 拿走：//QWORD rbx = *rsp_0x20;

    // QWORD *rdx;
    // QWORD *j = *rsp_0x20;
    // for (int i = 1;; j = rdx)
    // { // 0x4011bd:
    //     rdx = rsp_0x20[i];
    //     j[1] = rsp_0x20[i];
    //     i++;
    //     if (i == 6)
    //         break;
    // }
    QWORD *rdx = *rsp_0x20;
    for (QWORD i = 0; i != 6; i++)
        rdx = rdx[1] = rsp_0x20[i];
    rdx[1] = 0;

    QWORD *rbx = *rsp_0x20;
    for (int ebp = 5; ebp; rbx = rbx[1], --ebp)
        if (*(int *)rbx < *(int *)rbx[1])
            explode_bomb();
}