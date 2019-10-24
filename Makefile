.PHONY: clean

presentation.pdf: presentation.tex presentation.bib $(wildcard resources/*)
	latexmk -pdflatex="pplatex -c pdflatex --" -pdf -interaction=nonstopmode presentation.tex 2>&1 | tee latexmk_log.txt

clean:
	latexmk -C
	rm -f presentation.bbl presentation.run.xml \
		presentation.nav presentation.snm presentation.vrb latexmk_log.txt \
		result

check: presentation.pdf latexmk_log.txt
	#cat latexmk_log.txt | grep "o) Errors:" | tail -1 | grep "o) Errors: 0, Warnings: 0" || false
	cat latexmk_log.txt | grep "o) Errors:" | tail -1 | grep "o) Errors: 0" || false
