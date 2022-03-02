CC = gcc
OPT = -std=c11 -O1 -march=haswell -D
EXE = sort.

NUMBERS = 1000000

run:
	python3 scripts/random_gen.py $(NUMBERS) > tmp
	bin/$(EXE)QUICK > stats.txt
	bin/$(EXE)RADIX >> stats.txt
	bin/$(EXE)MERGE >> stats.txt
	bin/$(EXE)INSERTION >> stats.txt
	rm tmp
build:
	$(CC) $(OPT)QUICK src/sort.c -o bin/$(EXE)QUICK
	$(CC) $(OPT)RADIX src/sort.c -o bin/$(EXE)RADIX
	$(CC) $(OPT)INSERTION src/sort.c -o bin/$(EXE)INSERTION
	$(CC) $(OPT)MERGE src/sort.c -o bin/$(EXE)MERGE

all: build run
	