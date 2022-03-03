CC = gcc
OPT = -std=c11 -O1 -march=haswell -D
EXE = sort.

RAND = random_array
SORT = sorted_array

NUMBERS = 1000000

run:
	python3 scripts/random_gen.py $(NUMBERS) $(RAND)
	bin/$(EXE)QUICK $(RAND) > stats.txt
	bin/$(EXE)RADIX $(RAND) >> stats.txt
	bin/$(EXE)MERGE $(RAND) >> stats.txt
	bin/$(EXE)BUBBLE $(RAND) >> stats.txt
	bin/$(EXE)INSERTION $(RAND) >> stats.txt
	rm $(RAND)
	mv stats.txt stats/$(RAND)_stats.txt

	python3 scripts/sorted_gen.py $(NUMBERS) $(SORT)
	bin/$(EXE)QUICK $(SORT) > stats.txt
	bin/$(EXE)RADIX $(SORT) >> stats.txt
	bin/$(EXE)MERGE $(SORT) >> stats.txt
	bin/$(EXE)BUBBLE $(SORT) >> stats.txt
	bin/$(EXE)INSERTION $(SORT) >> stats.txt
	rm $(SORT)
	mv stats.txt stats/$(SORT)_stats.txt
build:
	$(CC) $(OPT)QUICK src/sort.c -o bin/$(EXE)QUICK
	$(CC) $(OPT)RADIX src/sort.c -o bin/$(EXE)RADIX
	$(CC) $(OPT)INSERTION src/sort.c -o bin/$(EXE)INSERTION
	$(CC) $(OPT)MERGE src/sort.c -o bin/$(EXE)MERGE
	$(CC) $(OPT)BUBBLE src/sort.c -o bin/$(EXE)BUBBLE

all: build run
	