#include<stdio.h>
#define __int64 long long
#define _BYTE unsigned char
FILE * infile;
char input_strings[]; // 0x603780
int num_input_strings;
char *skip()
{
  char *v0; // rax
  char *v1; // rbx

  do
  {
    v0 = fgets((char *)(80LL * num_input_strings + 0x603780), 80, infile);
    v1 = v0;
  }
  while ( v0 && (unsigned int)blank_line(v0) );
  return v1;
}
const char *read_line()
{
  int num; // edx
  const char *buf; // rsi
  unsigned __int64 len; // kr08_8
  int v3; // eax
  __int64 v4; // rax

  if ( !skip() )/* error handle */
  {
    if ( infile == (FILE *)stdin )
    {
      puts("Error: Premature EOF on stdin");
      exit(8);
    }
    if ( getenv("GRADE_BOMB") )
      exit(0);
    infile = (FILE *)stdin;
    if ( !skip() )
    {
      puts("Error: Premature EOF on stdin");
      exit(0);
    }
  }
  num = num_input_strings;
  buf = (const char *)(80LL * num_input_strings + 0x603780);
  len = strlen(buf) + 1;
  if ( (int)len - 1 > 78 )/* error handle */
  {
    puts("Error: Input line too long");
    v3 = num_input_strings++;
    v4 = 10LL * v3;
    input_strings[v4] = 0x636E7572742A2A2ALL;
    qword_603788[v4] = 0x2A2A2A64657461LL;
    explode_bomb();
  }
  *((_BYTE *)&input_strings[10 * num_input_strings - 1] + (int)len + 6) = 0;
  num_input_strings = num + 1;
  return buf;
}