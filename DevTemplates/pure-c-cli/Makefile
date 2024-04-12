# sudo dnf install gcc
all:
	gcc -Wall -Wextra -std=c11 *.c -o main

build: all

.PHONY: clean

clean:
	rm -rf *.o *.out main

run:
	./main
