.PHONY: simple all full pdf html fix clean

simple :
	R -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

all : pdf html
	R -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

full : fix
	rm -f _main.*
	R -e "bookdown::render_book('index.Rmd', 'all')"

html : fix
	R -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

pdf : fix
	rm -f _main.*
	R -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"

fix : clean
	python converter.py

clean :
	rm -rf docs/*
	rm -rf media/*
