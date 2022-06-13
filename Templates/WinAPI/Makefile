all:
	x86_64-w64-mingw32-g++ -Wall -Wextra -std=c++17 -static-libgcc -static-libstdc++ -mwindows *.cpp -o main

build: all

.PHONY: clean

clean:
	rm -rf *.exe

run:
	wine main.exe
