# This is a Makefile for producing a latex pdf.
# Repo: https://github.com/fiedl/dot-zsh
#
# Just type `make` to run it.

# The project name and therefore the name of the main
# tex file and the pdf is determined automatically.
# Override by setting the `PROJECT_NAME` environment
# variable.
PROJECT_NAME=$(shell ./lib/scripts/get_project_name.rb)
PROJECT=$(PROJECT_NAME)

PDFLATEX=pdflatex --output-directory=build -interaction=nonstopmode -file-line-error-style

all: $(PROJECT).pdf
run: all

# http://stackoverflow.com/a/7507834/2066546
# include other_makefile

TIKZ_FILES = $(wildcard img/*.tikz)
PDFTIKZ_FILES = $(patsubst %.tikz,%.pdf,$(TIKZ_FILES))

img/%.pdf: img/%.tikz
	cd $(TIKZDIR); \
	pdflatex $$(basename $<)

# Tell `make` which targets are no files.
# http://stackoverflow.com/a/2145605/2066546
.PHONY : FORCE_MAKE

MARKDOWN_FILES = $(wildcard text/*.md.tex)
CONVERTED_MARKDOWN_FILES = $(patsubst %.md.tex,%.tex,$(MARKDOWN_FILES))

markdown: ${CONVERTED_MARKDOWN_FILES}
text/%.tex: text/%.md.tex
	cd text
	#cat $(patsubst %.md.tex,%,$<).md.tex |sed '/^%/d' |sed 's/\\/\\\\/g' > $(patsubst %.md.tex,%,$<).md.tmp.tex
	#pandoc $(patsubst %.md.tex,%,$<).md.tmp.tex --from markdown --to latex > $(patsubst %.md.tex,%,$<).tmp.tex
	#cat $(patsubst %.md.tex,%,$<).tmp.tex |sed 's/\\textbackslash{}/\\/g' |sed 's/\\{\(.*\)\\}/{\1}/g' > $(patsubst %.md.tex,%,$<).tex
	#
	cat $(patsubst %.md.tex,%,$<).md.tex |sed '/^%/d' > $(patsubst %.md.tex,%,$<).md.tmp.tex
	pandoc $(patsubst %.md.tex,%,$<).md.tmp.tex --from markdown --to latex > $(patsubst %.md.tex,%,$<).tex

bibliography: build/$(PROJECT).bbl

build/$(PROJECT).bbl: build/$(PROJECT).bcf
	biber build/$(PROJECT)

build/$(PROJECT).bcf: $(PROJECT).tex
	mkdir -p build
	$(PDFLATEX) $(PROJECT)

dependencies: ${PDFTIKZ_FILES} markdown bibliography

tex: $(PROJECT).pdf

$(PROJECT).pdf: build/$(PROJECT).pdf
	-ln -s build/$(PROJECT).pdf $(PROJECT).pdf

build/$(PROJECT).pdf : $(PROJECT).tex FORCE_MAKE dependencies
	$(PDFLATEX) $(PROJECT)
	-rm $(CONVERTED_MARKDOWN_FILES)

clean:
	# The minus sign in front of `rm` prevents this clean task
	# from returning a fail status code if the files are not present.
	-rm $(PROJECT).pdf
	-rm build/*
	-rm text/*.log
	-rm text/*.tmp.tex
	-rm $(CONVERTED_MARKDOWN_FILES)
	-rm *.aux *.bcf *.fls *.run.xml *.synctex.gz *.fdb_latexmk *.log