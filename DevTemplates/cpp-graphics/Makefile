# https://sdl-bgi.sourceforge.io
# sudo dnf install SDL2-devel
# sudo dnf install ./SDL_bgi-3.0.2-1.x86_64.rpm

all:
	g++ -Wall -Wextra -std=c++20 -lSDL_bgi -lSDL2 *.cpp -o main

build: all

.PHONY: clean

clean:
	rm -rf *.o main

run:
	./main
