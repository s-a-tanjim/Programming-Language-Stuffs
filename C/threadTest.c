#include <stdio.h>
#include <pthread.h>
pthread_t t[2];
int coin_flip;
pthread_mutex_t flip_done;
volatile int count, i;

static void *thread2(void *_)
{
  printf("Count: %d ", count);
  if (count == 5)
    printf("Hello count %d\n", count);
  for (i = 0; i < 10000000; i++)
    ;
  printf("hhhhh");
}

static void *thread1(void *_)
{
  printf("Thread 1: flipped coin %d\n", coin_flip);
  for (i = 0; i < 100; i++)
  {
    printf("%d ", i);
    count++;
    if (count == 7)
      count = 0;
  }
  printf("\n\n\n");
  for (i = 0; i < 100; i++)
  {
    printf("%d ", i);
    count++;
    if (count == 7)
      count = 0;
  }
}

void main()
{
  pthread_create(&t[1], NULL, thread2, NULL);
  pthread_create(&t[0], NULL, thread1, NULL);

  pthread_exit(NULL);
}
