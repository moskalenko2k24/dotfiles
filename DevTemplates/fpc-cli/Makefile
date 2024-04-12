# sudo dnf install fpc
all:
	fpc -l- -v0 program.pas

build : all

.PHONY: clean

clean:
	rm -rf *.o *.out program

run:
	./program
