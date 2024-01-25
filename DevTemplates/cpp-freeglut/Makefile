# sudo dnf install freeglut freeglut-devel
all:
	g++ -Wall -Wextra -std=c++17 *.cpp -lGL -lglut -o main

build: all

.PHONY: clean

clean:
	rm -rf *.o *.out main

run:
	./main
