
#include <stdio.h>
int rev(int x)
{
  int div = 10, rem, rev = 0;
  while (1)
  {
    rem = x % div;
    rev = rev * 10 + rem;
    x = x / div;
    if (x == 0)
      break;
  }
  return rev;
}
main()
{
  int i, n, rem = 0, numb = 0;
  scanf("%d", &n);
  while (n > 0)
  {
    rem = n % 2;
    numb = numb * 10 + rem;
    n = n / 2;
  }
  printf("%d\n", numb);

  i = rev(numb);

  printf("%d", i);
}
