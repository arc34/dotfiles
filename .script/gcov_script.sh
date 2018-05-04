#!/bin/bash
shopt -s globstar
gcov_data_dir="./gcovdata/${PWD##*/}"
make
make tests
for x in ./**/*.c; do
  mkdir -p "$gcov_data_dir/${x%/*}"
  (cd "${x%/*}" && gcov "${x##*/}") &&
  mv "$x.gcov" "$gcov_data_dir/${x%/*}"
done
