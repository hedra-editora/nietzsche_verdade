all:
	svn propset svn:keywords "Date Id Rev" *.tex
	pdflatex NIETZSCHE.tex
	evince NIETZSCHE.pdf
dub:
	svn propset svn:keywords "Date Id Rev" *.tex
	pdflatex NIETZSCHE.tex	
	pdflatex NIETZSCHE.tex
	evince NIETZSCHE.pdf
tags:
	 svn copy ../trunk/ svn://dev.hedra.com.br/hedra/<LIVRO>/tags/release-1.0 -m "primeira edição"

dic:
	@echo "personal_ws-1.1 pt_BR `cat *.tex | aspell -l pt_BR -t list | sort | uniq | wc -l` utf-8" > dic.pws
	@cat *.tex | aspell -l pt_BR -t list | sort | uniq >> dic.pws
	sh dic.sh
erros:
	@cat *.tex | aspell --extra-dicts=./dic.pws -t list | sort | uniq
corrige:
	clear 
	sh dic.sh
clean:
	rm *.aux *.dvi *.log NIETZSCHE.pdf *.ps *.toc
