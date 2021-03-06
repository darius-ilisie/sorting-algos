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

with open(FILENAME, "a") as f:
    for i in range(NUMBERS):
        f.write("{} ".format(int(random.random()*10000000000) % (LARGEST_NUMBER + 1)))

