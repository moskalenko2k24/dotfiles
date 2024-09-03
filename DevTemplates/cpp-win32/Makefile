# https://fedoraproject.org/wiki/MinGW
# https://fedoraproject.org/wiki/MinGW/Tutorial
# https://docs.fedoraproject.org/en-US/quick-docs/wine/
# sudo dnf install wine mingw64-gcc mingw64-gcc-c++
all:
	x86_64-w64-mingw32-g++ -Wall -Wextra -std=c++20 -static-libgcc -static-libstdc++ -mwindows *.cpp -o simple_window

build: all

.PHONY: clean

clean:
	rm -rf *.exe

run:
	wine simple_window.exe
