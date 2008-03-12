RM = /bin/rm -f

C++ = g++
CCFLAGS = -O3 -g -I.

LDFLAGS = 

.PHONY: clean

all: fastqfilter fastqascii2txtqual fastqtrim fastqpolyremove

fastqfilter: fastqfilter.cpp fastqreader.h fastqwriter.h scoredsequence.h
	@echo --- $@ ---
	$(C++) $(CCFLAGS) fastqfilter.cpp -o fastqfilter $(LDFLAGS)

fastqtrim: fastqtrim.cpp fastqreader.h fastqwriter.h scoredsequence.h
	@echo --- $@ ---
	$(C++) $(CCFLAGS) fastqtrim.cpp -o fastqtrim $(LDFLAGS)

fastqascii2txtqual: fastqascii2txtqual.cpp fastqreader.h fastqwriter.h scoredsequence.h
	@echo --- $@ ---
	$(C++) $(CCFLAGS) fastqascii2txtqual.cpp -o fastqascii2txt $(LDFLAGS)

fastqpolyremove: fastqployremove.cpp fastqreader.h fastqwriter.h scoredsequence.h
	@echo --- $@ ---
	$(C++) $(CCFLAGS) fastqployremove.cpp -o fastqpolyremove

install: fastqascii2txtqual fastqtrim fastqfilter
	cp fastqascii2txtqual ../bin
	cp fastqtrim ../bin
	cp fastqfilter ../bin

clean:
	@echo --- $@ ---
	-$(RM) *.o core

