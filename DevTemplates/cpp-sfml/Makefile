# sudo dnf install gcc gcc-c++ SFML SFML-devel
all:
	g++ -Wall -Wextra -std=c++17 *.cpp -lsfml-graphics -lsfml-window -lsfml-system -o main

build: all

.PHONY: clean

clean:
	rm -rf *.o *.out main

run:
	./main
