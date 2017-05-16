# This is a Makefile for producing a latex pdf.
# Repo: https://github.com/fiedl/dot-zsh
#
# Just type `make` to run it.

# The project name and therefore the name of the main
# tex file and the pdf is determined automatically.
# Override by setting the `PROJECT_NAME` environment
# variable.
PROJECT_NAME=$(shell ./lib/scripts/get_project_name.rb)

all: $(PROJECT_NAME).pdf


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

dependencies: ${PDFTIKZ_FILES} markdown

$(PROJECT_NAME).pdf : $(PROJECT_NAME).tex FORCE_MAKE dependencies
	pdflatex $(PROJECT_NAME).tex
	rm $(CONVERTED_MARKDOWN_FILES)

cleanup:
	# The minus sign in front of `rm` prevents this cleanup task
	# from returning a fail status code if the files are not present.
	-rm text/*.log
	-rm text/*.tmp.tex
	-rm $(CONVERTED_MARKDOWN_FILES)