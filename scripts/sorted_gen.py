import random
from sys import argv

with open("/dev/urandom", "rb") as f:
    s_bytes = f.read(4)
    random.seed(s_bytes)

LARGEST_NUMBER = 2147483647
NUMBERS = int(argv[1])
FILENAME = argv[2]

with open(FILENAME , "w") as f:
    f.write(f"{NUMBERS} ")

with open(FILENAME, "a") as f:
    first_num = random.randint(0, (2147483647))

    for e in range(first_num, first_num+NUMBERS):
        f.write(f"{e} ")