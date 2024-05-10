# sudo dnf install gcc gcc-c++ freeglut freeglut-devel
all:
	g++ -Wall -Wextra -std=c++20 *.cpp -lGL -lglut -o main

build: all

.PHONY: clean

clean:
	rm -rf *.o *.out main

run:
	./main
