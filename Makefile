VERSION=2.4b
GHC = ghc
GHC_OPTS = #-Wall

GHC_OPTS += -iformats -iformats/haskell2 -iformats/haskell-gadt -iformats/xml -iformats/profile -iformats/java -iformats/java1.5 -iformats/cpp -iformats/c  -iformats/oz -iformats/ocaml -iformats/f-sharp -iformats/cpp_stl -iformats/c-sharp

#GHC_OPTS += -package util

GHCI = ghci

HUGS = hugs

BNFC = bnfc
BNFC_OPTS = -alex2

all: ParBNF.hs LexBNF.hs
	$(GHC) $(GHC_OPTS) --make CFTop -o bnfc
	strip bnfc
ghci:
	$(GHCI) $(GHC_OPTS) CFTop
hugs:
	$(HUGS) -P.:for-hugs:formats:formats/haskell2:formats/haskell-gadt:formats/java:formats/java1.5:formats/cpp:formats/c:: CFTop

%.hs : %.y
	happy -agc $<

%.hs : %.x
	alex -g $<

Par%.y Lex%.x : %.cf
	bnfc $<

frontend:
	$(BNFC) $(BNFC_OPTS) -m BNF.cf ; $(MAKE) -f makefile ; rm makefile

distr:
	rm -fr BNFC_$(VERSION)
	mkdir BNFC_$(VERSION)
	cvs export -d BNFC_$(VERSION) -rHEAD BNFC
	rm -rf BNFC_$(VERSION)/doc/* ; cp doc/LBNF-report.tex BNFC_$(VERSION)/doc/
	tar cvfz BNFC_$(VERSION).tgz BNFC_$(VERSION)

clean: 
	rm -f *.hi *.o *.y *.aux *.log *~ formats/haskell2/*.hi formats/haskell2/*.o formats/haskell2/*~ formats/*.hi formats/*.o formats/*~ formats/java/*.hi formats/java/*.o formats/java/*~ formats/java1.5/*.hi formats/java1.5/*.o formats/java1.5/*~ formats/cpp/*.hi formats/cpp/*.o formats/cpp/*~formats/cpp_stl/*.hi formats/cpp_stl/*.o formats/cpp_stl/*~ formats/c/*.hi formats/c/*.o formats/c/*~

