#include <stdio.h>
#include <stdlib.h>
#include <time.h>

char shift_char(char c, int shift)
{
  int val = (int)c;

  if (val > 96 && val < 123)
  {
    return (char)(((val - 97 + shift) % 26) + 97);
  }
  else if (val > 64 && val < 91)
  {
    return (char)(((val - 65 + shift) % 26) + 65);
  }
  else
  {
    return c;
  }
}

void apply_cipher(char *filepath, int shift)
{
  FILE *fp;
  FILE *fp2;
  char c;

  fp = fopen(filepath, "r");
  fp2 = fopen("output.txt", "w");
  c = getc(fp);
  clock_t before = clock();
  while (c != EOF)
  {
    putc(shift_char(c, shift), fp2);
    c = getc(fp);
  }
  clock_t after = clock();
  fclose(fp);
  fclose(fp2);

  printf("Completed in %lu ms\n", (after - before) / 1000);
  return;
}

int main(int argc, char **argv)
{
  if (argc != 3)
  {
    printf("Usage: %s <file_to_decode> <shift_value>\n", argv[0]);
    return 0;
  }

  char *filepath = argv[1];
  int shift = atoi(argv[2]);

  apply_cipher(filepath, shift);
  return 0;
}
