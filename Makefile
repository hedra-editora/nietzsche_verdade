TITULO = "MI_TRANS_PASSARO_MIOLO"
GIT = `git log -1 --date=short --format=format:'%h'`

all:
	git log -1 --date=short --format=format:'\newcommand{\RevisionInfo}{%h}' > gitrevisioninfo.sty
	latexmk -xelatex LIVRO.tex
rename:
	cp LIVRO.pdf $(TITULO)_MIOLO_$(GIT).pdf
clean_arquivosgerais:
	mv ~/Dropbox/ARQUIVOS_GERAIS/$(TITULO)_MIOLO_* ~/Dropbox/ARQUIVOS_GERAIS/OLD/
delivery:
	cp $(TITULO)_MIOLO_$(GIT).pdf ~/Dropbox/ARQUIVOS_GERAIS/
	echo $(GIT) '--- Entregue em' "$$(date)" >> ENTREGAS.txt

erros:
	-grep --color=auto "LaTeX Error" LIVRO.log
	-grep --color=auto -A 3 "Undefined" LIVRO.log
test:
	xelatex LIVRO.tex
	xelatex LIVRO.tex
	evince LIVRO.pdf
clean:
	-rm *xdv *aux *log *tui *toc *.4ct *.4tc *.html *.css *.dvi *.epub *.lg *.ncx *.xref *.tmp *.idv *.opf *.fls *_latexmk LIVRO.pdf
	-rm -rf EBOOK-epub
	-rm -rf EBOOK-epub3
	-rm -rf EBOOK-mobi
