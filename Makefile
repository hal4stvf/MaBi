#Latex Makefile

FILE = BiVa 
EXDIR = "exercise/Anton_Dennis/Blatt_3/"
EX = "${EXDIR}B3A2.tex"

all:$(FILE) clean

ex: EX clean

$(FILE).pdf: **/*.tex *.tex *.sty
	pdflatex $(FILE)
	pdflatex $(FILE)

EX: **/*.tex *.sty
	pdflatex --shell-escape $(EX) 
#	mv $(EX) $(EXDIR)

hw: 
	vim $(EX)

clean:
	rm -rf **/*.{aux,blg,brf,log,out,ilg,toic,tdo} *~
	rm -rf *.{aux,blg,brf,log,out,ilg,toic,tdo} **/*~

