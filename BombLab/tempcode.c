#define __int64 long long
typedef unsigned char BYTE;
typedef int _DWORD;
typedef long long QWORD;
#define noreturn _Noreturn

#define begin \
    void f()  \
    {
#define end }

int node1, arr[];

begin QWORD rsp_0x20[6];
for (int i = 0; i != 6; ++i)
{
    QWORD *rdx = &node1;
    for (int j = 1; j != arr[i]; ++j)
        rdx = (QWORD *)rdx[1];
    rsp_0x20[i] = (QWORD)rdx;
}
end

void noreturn sig_handler()
{
  puts("So you think you can stop the bomb with ctrl-c, do you?");
  sleep(3u);
  __printf_chk(1LL, "Well...");
  fflush(stdout);
  sleep(1u);
  puts("OK. :-)");
  exit(16);
}

char s[88];
if (num_input_strings == 6)
{
  if (__isoc99_sscanf((char *)0x603870, "%d %d %s", &a, &b, s) == 3 
    && !strings_not_equal(s, "HiEvil"))
  {
    puts("Curses, you've found the secret phase!");
    puts("But finding it and solving it are quite different...");
    secret_phase();
  }
  puts("Congratulations! You've defused the bomb!");
}

void secret_phase()
{
  const char* input = read_line();
  int number = strtol(input, NULL, 10);
  if ( number - 1 > 1000 || fun7(&n1, number) != 2 )
    explode_bomb();
  puts("Wow! You've defused the secret stage!");
  phase_defused();
}
struct node
{
  __int64 val;
  struct node *child[2];
};
int fun7(struct node *o, int i)
{
  if (!o)
    return 0xFFFFFFFFLL;
  if (o->val > i)
    return 2 * fun7(o->child[0], i);
  if (o->val < i)
    return 2 * fun7(o->child[0], i) + 1;
  return 0;
}