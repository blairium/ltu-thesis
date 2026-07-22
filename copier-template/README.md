# ltu-thesis Copier template

A [Copier](https://github.com/copier-org/copier) template for scaffolding a personalized copy of the [(unofficial) La Trobe PhD Thesis LaTeX Template](../README.md). It asks for your title, name, supervisors, department, etc. and fills in the configuration block that used to require hand-editing `thesis.tex`.

This file documents the template itself, for people maintaining or extending it. If you're looking for how to *use* the template to start a thesis, see the [root README](../README.md#quick-start-with-copier).

## Layout

```
copier-template/
  copier.yml       # Questions asked by `copier copy`, and the LaTeX-safe Jinja delimiters
  test.sh           # Renders the template and compiles the result, to catch regressions
  template/         # Everything copied into the generated project (this is `_subdirectory`)
    thesis.tex.jinja      # Root document; only file with real Jinja substitutions
    README.md.jinja        # README for the generated project
    classicthesis-config.tex, classicthesis.sty, text/, figures/, tables/, ...
```

Only `thesis.tex.jinja` and `README.md.jinja` contain Jinja logic. Every other file under `template/` only ever references the `\myXxx` LaTeX macros (`\myTitle`, `\myFirstName`, ...) that `thesis.tex.jinja` defines once, so they're copied verbatim.

## Why the LaTeX-friendly delimiters

Copier renders `copier.yml` itself and every template file with one shared Jinja environment. The default `{{ }}` / `{% %}` delimiters collide with LaTeX's own curly braces (`\newcommand{\myTitle}{...}`), so `copier.yml` sets `_envops` to use `\VAR{ }` for variables and `\BLOCK{ }` for logic instead — including inside `validator:` expressions. See `copier.yml` for the full delimiter set.

## Testing changes

```sh
./test.sh
```

This renders the template with its defaults into `../my-thesis-test/` and compiles it with `pdflatex`/`biber` to make sure the generated project still builds. Requires `uvx` (or `pip install copier`) and a TeX Live installation.

## Updating an already-generated thesis

Anyone who scaffolded a project from this template can pull in later template changes with:

```sh
copier update
```

Copier tracks their answers in `.copier-answers.yml` inside their project.
