void phase_3(char *input)
{
  int result, a, b;
  if ((int)__isoc99_sscanf(
          input, "%d %d", &a, &b) <= 1)
    explode_bomb();
  switch (a)
  {
  case 0: result = 207; break;
  case 1: result = 311; break;
  case 2: result = 707; break;
  case 3: result = 256; break;
  case 4: result = 389; break;
  case 5: result = 206; break;
  case 6: result = 682; break;
  case 7: result = 327; break;
  default:
    explode_bomb();
  }
  if (result != b)
    explode_bomb();
}