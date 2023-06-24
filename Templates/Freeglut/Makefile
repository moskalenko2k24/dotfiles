# on Fedora use
# sudo dnf install freeglut
# to install library before compiling project
all:
	g++ -Wall -Wextra -std=c++17 *.cpp -lGL -lglut -o main

build: all

.PHONY: clean

clean:
	rm -rf *.o *.out main

run:
	./main
