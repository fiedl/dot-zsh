#!/usr/bin/env zsh
make clean \
  && make dependencies \
  && make tex \
  #&& /Library/TeX/texbin/pdflatex $* \
  && make clean