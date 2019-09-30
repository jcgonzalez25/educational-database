
from random import randrange 
tlist = [
  "llamas",
  "hawks",
  "vultures",
  "elks",
  "eagles",
  "ants",
  "deer",
  "chickens"]

for i in range(100):
  t1 = randrange(0,8)
  t2 = randrange(0,8)
  while t1 == t2:
    t2 = randrange(0,8)
  print("insert into games values('{0:s}',{1:d},'{2:s}',{3:d});".format(
    tlist[t1],randrange(0,10),tlist[t2],randrange(0,10)))

