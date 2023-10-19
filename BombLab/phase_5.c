#define __int64 long long
char array_3449[] = {'m', 'a', 'd', 'u', 'i', 'e', 'r', 's', 'n', 'f', 'o', 't', 'v', 'b', 'y', 'l'};
__int64 rsp, rdx;
int ecx, edx;
void phase_5(char *input)
{
    char rsp_0x10[8];
    __int64 rsp_0x18 = __readfsqword(0x28u);
    if (string_length() != 6)
        explode_bomb();
/*     // 0x4010d2:
    __int64 i = 0;
    do
    { // 0x40108b:
        ecx = *(char *)(input + i);
        *(int *)rsp = ecx & 0xff;
        rdx = *(__int64 *)rsp;
        edx &= 0xf;
        edx = array_3449[rdx];
        rsp_0x10[i] = edx & 0xff;
    } while (i != 6); */

    for (__int64 i = 0; i != 6; ++i)
        rsp_0x10[i] = array_3449[input[i] & 0xF];
    // 0x4010ae:
    rsp_0x10[6] = 0;
    if (strings_not_equal(rsp_0x10, "flyers"))
        explode_bomb();
    // 0x4010d9:
    if (__readfsqword(0x28u) ^ rsp_0x18)
        __stack_chk_fail();
}