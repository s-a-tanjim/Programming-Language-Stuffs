#include <stdio.h>
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
  int *ptr;

  try
  {
    ptr = new int[-6];
  }
  catch (exception &e)
  {
    cout << "error\n"
         << e.what() << endl;
  }
  if (ptr == NULL)
    cout << "Null\n";
  delete[] ptr;

  return 0;
}
