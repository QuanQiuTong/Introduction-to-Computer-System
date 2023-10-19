void phase_4(char *input)
{
  int a, b;
  if (sscanf(input, "%d %d", &a, &b) != 2 ||
      a > 0xE)
    explode_bomb();
  if (func4(a, 0, 14) || b)
    explode_bomb();
}
int func4(int a, int b, int c)
{
  int mid = (c - b) / 2 + b;
  if (mid > a)
    return 2 * func4(a, b, mid - 1);
  if (mid < a)
    return 2 * func4(a, mid + 1, c) + 1;
  return 0;
}