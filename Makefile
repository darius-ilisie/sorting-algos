C = gcc
OPT = -O3 -march=haswell -D
EXE = sort.

run:
	python3 scripts/random_gen.py > bin/tmp
	cd bin/
	./$(EXE).QUICK

	cd ../

build:
	$(C) $(OPT)QUICK src/sort.c -o bin/$(EXE)QUICK