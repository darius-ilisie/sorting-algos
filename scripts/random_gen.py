import random
from sys import argv

LARGEST_NUMBER = 2147483647
NUMBERS = int(argv[1])

with open("/dev/urandom", "rb") as f:
    s_bytes = f.read(4)
random.seed(s_bytes)
# generate some random numbers
print(f"{NUMBERS}", end=' ')
for i in range(NUMBERS):
    print("{}".format(int(random.random()*10000000000) % (LARGEST_NUMBER + 1)), end=' ')
