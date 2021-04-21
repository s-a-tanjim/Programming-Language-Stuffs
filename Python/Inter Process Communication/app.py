import multiprocessing
from script1 import app1
from script2 import app2 
import time

if __name__ == '__main__':
  val = multiprocessing.Value('i') #int i

  p1 = multiprocessing.Process(target=app1, args=(val,))
  p2 = multiprocessing.Process(target=app2, args=(val,))

  p1.start()
  p2.start()

  p1.join()
  p2.join()