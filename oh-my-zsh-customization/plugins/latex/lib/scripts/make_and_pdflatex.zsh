#!/usr/bin/env zsh
make cleanup \
  && make dependencies \
  && /Library/TeX/texbin/pdflatex $* \
  && make cleanup