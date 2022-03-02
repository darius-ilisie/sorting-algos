import random

LARGEST_NUMBER = 2147483647
NUMBERS = 1000000

with open("/dev/urandom", "rb") as f:
    s_bytes = f.read(4)
random.seed(s_bytes)
# generate some random numbers
print(f"{NUMBERS}", end=' ')
for i in range(NUMBERS):
    print("{}".format(int(random.random()*10000000000) % (LARGEST_NUMBER + 1)), end=' ')
