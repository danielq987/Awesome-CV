.PHONY: examples resume.pdf cv.pdf coverletter.pdf

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
SRC_DIR = src

#examples: $(foreach x, coverletter cv resume, $x.pdf)
#
#resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
#	$(CC) -output-directory=$(EXAMPLES_DIR) $<
#
#cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
#	$(CC) -output-directory=$(EXAMPLES_DIR) $<
#
#coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
#	$(CC) -output-directory=$(EXAMPLES_DIR) $<
OUT_FILE = out/daniel-qu-resume$(shell date +%s).pdf
HOST_PATH = ~/www/daniel-qu-resume.pdf
HFCS = d3qu@hfcs.csclub.uwaterloo.ca

export:
	cp $(SRC_DIR)/out/resume.pdf $(OUT_FILE)
	qpdf $(OUT_FILE) --pages . 1 -- daniel-qu-resume.pdf
	qpdf $(OUT_FILE) --pages . 2-3 -- daniel-qu-portfolio.pdf
	scp $(OUT_FILE) $(HFCS):$(HOST_PATH)

exportww:
	cp $(SRC_DIR)/out/resume.pdf out/daniel-qu-resume-ww$(shell date +%s).pdf

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
