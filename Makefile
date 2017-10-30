
# vim: noet ts=8:

LC_CTYPE="en_US-iso8859-1"

FONTS  =
#FONTS += fonts/FiraSans-Italic.ps
#FONTS += fonts/FiraSans-Bold.ps
FONTS += fonts/FiraSans-Medium.ps
FONTS += fonts/FiraSans-Regular.ps

all: 		filing-labels.pdf

clean:
		rm -f fonts.ps 
		rm -f filing-labels.ps

%.pdf: 		%.ps
		pstopdf $< || ps2pdf $<

filing-labels.ps: 	filing-labels.src.ps fonts.ps
		sed '/^%%@Fonts/r fonts.ps' $< > $@

fonts.ps: 	$(FONTS) Makefile
		cat $(FONTS) > fonts.ps


