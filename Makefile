#Latex Makefile

FILE = BiVa 

all:$(FILE) clean

$(FILE).pdf: **/*.tex *.tex *.sty
	pdflatex $(FILE)
	pdflatex $(FILE)

clean:
	rm -rf **/*.{aux,blg,brf,log,out,ilg,toic,tdo} *~
	rm -rf *.{aux,blg,brf,log,out,ilg,toic,tdo} **/*~
