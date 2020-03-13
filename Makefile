.PHONY: all pdf html

all:
	-rm -f _main.*
	-tools/layout-additions.py
	-R -e "bookdown::render_book('index.Rmd', 'all')"
	-mv -f tmp/* ./

html:
	-rm -f _main.*
	-tools/layout-additions.py
	-R -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
	-mv -f tmp/* ./

pdf:
	-rm -f _main.*
	-tools/layout-additions.py
	-R -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
	-mv -f tmp/* ./

