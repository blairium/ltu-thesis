#!/bin/bash
# Renders this Copier template with its defaults and does a full LaTeX compile
# of the result (the same pdflatex -> biber -> pdflatex x2 cycle `arara` runs),
# to catch template regressions (bad Jinja, missing files, broken
# \newcommand substitution, ...).
set -e

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
out_dir="$script_dir/../my-thesis-test"

rm -rf "$out_dir"

uvx copier copy --defaults "$script_dir" "$out_dir"

cd "$out_dir"
pdflatex -interaction=nonstopmode -halt-on-error thesis.tex > pdflatex1.log
biber thesis > biber.log
pdflatex -interaction=nonstopmode -halt-on-error thesis.tex > pdflatex2.log

echo "Rendered and compiled OK: $out_dir/thesis.pdf"

cd - > /dev/null
rm -rf "$out_dir"
