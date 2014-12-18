
title=continuous-improvement
full_title=2014-11-22-$(title)

pdf: *.adoc
	asciidoctor -a docinfo -b docbook -d article $(full_title).adoc
	a2x -d article -f pdf --dblatex-opts "-P latex.output.revhistory=0 -P latex.output.toc=0" $(full_title).xml
	rm $(full_title).xml

