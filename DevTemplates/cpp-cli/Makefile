# sudo dnf install gcc gcc-c++
all:
	g++ -Wall -Wextra -std=c++17 *.cpp -o main

build: all

.PHONY: clean

clean:
	rm -rf *.o *.out main

run:
	./main
