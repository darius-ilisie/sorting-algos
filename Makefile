CC = gcc
OPT = -O1 -march=haswell -D
EXE = sort.

run:
	python3 scripts/random_gen.py > tmp
	bin/$(EXE)QUICK > stats.txt
	bin/$(EXE)RADIX >> stats.txt
	rm tmp
build:
	$(CC) $(OPT)QUICK src/sort.c -o bin/$(EXE)QUICK
	$(CC) $(OPT)RADIX src/sort.c -o bin/$(EXE)RADIX

all: build run
	