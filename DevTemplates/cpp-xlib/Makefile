# sudo dnf install gcc gcc-c++ libX11-devel
all:
	g++ -Wall -Wextra -std=c++20 *.cpp -lX11 -o main

build: all

.PHONY: clean

clean:
	rm -rf *.o *.out main

run:
	./main
