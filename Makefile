#Latex Makefile

FILE = BiVa.tex 

all:$(FILE).pdf

.PHONY: clean
clean:
	rm -rf **/*.aux **/*.blg **/*.out **/*.l*
	rm -rf *.aux *.blg *.out *.l* *.tdo *.toc


$(FILE).pdf: **/*.tex *.tex *.sty
	pdflatex $(FILE).tex

