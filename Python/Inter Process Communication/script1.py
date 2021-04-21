import time

def app1(val):
  while True:
    print("From app1:")
    print(val.value)
    val.value = val.value+1
    time.sleep(1)

