PROJ=resume

.PHONY: $(PROJ).pdf all clean

all: $(PROJ).pdf

$(PROJ).pdf: $(PROJ).tex
	latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape -aux-directory=out -output-directory=out $(PROJ).tex
