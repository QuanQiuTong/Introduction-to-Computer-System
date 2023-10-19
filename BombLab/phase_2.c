#include <stdnoreturn.h>
typedef int DWORD;
typedef long long QWORD;
DWORD eax;
QWORD rsp, rbx, rbp;
void read_six_numbers();
noreturn void explode_bomb();
void phase_2()
{
    read_six_numbers(rsp);
    if (*(QWORD *)rsp != 1)
        explode_bomb();

    { // 400f30:
        rbx = rsp + 4;
        rbp = rsp + 0x18;
    }
    do
    { // 400f17:
        eax = *(int *)(rbx - 4);
        eax += eax;
        if (eax != *(int *)rbx)
            explode_bomb();
        rbx += 4;
    } while (rbp != rbx);
}
void phase_2()
{
    int arr[6];
    read_six_numbers(arr);
    if (arr[0] != 1)
        explode_bomb();
    for (int *p = arr + 1; p != arr + 6; ++p)
        if (*p != 2 * p[-1])
            explode_bomb();
}
void phase_2()
{
    int a[6];
    read_six_numbers(a);
    if (a[0] != 1)
        explode_bomb();
    for (int i = 1; i <= 6; ++i)
        if (a[i] != 2 * a[i - 1])
            explode_bomb();
}