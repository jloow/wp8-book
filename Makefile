all:
	wsl -- rm -f _main.*
	R -e "bookdown::render_book('index.Rmd', 'all')"
