import random
from sys import argv

LARGEST_NUMBER = 2147483647
NUMBERS = int(argv[1])
FILENAME = argv[2]

with open("/dev/urandom", "rb") as f:
    s_bytes = f.read(4)
random.seed(s_bytes)
# generate some random numbers

with open(FILENAME, "w") as f:
    f.write(f"{NUMBERS} ")

arr = []
for i in range(NUMBERS):
    arr.append( int(random.random()*10000000000) % (LARGEST_NUMBER + 1) )
arr[0:NUMBERS//2] = sorted(arr[0:NUMBERS//2])

with open(FILENAME, "a") as f:
    for i in range(NUMBERS):
        f.write(f"{arr[i]} ")

