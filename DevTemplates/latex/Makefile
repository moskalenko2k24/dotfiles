all: build

build:
	latex test.tex && dvips -o test.ps test.dvi && ps2pdf test.ps test.pdf

clean:
	rm *.dvi *.ps *.aux *.log *.pdf
