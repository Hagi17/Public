IDIR=include
CC=g++
CFLAGS=-I$(IDIR) -std=c++11

ODIR = obj

_DEPS = state.h turingmachine.h transition.h tape.h support.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = tmsim.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.cpp $(DEPS)
	$(CC) -c $(CFLAGS) $< -o $@

tm: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
	
toytm: $(OBJ)
	$(CC) -D ENABLE_TOY -o $@ $^ $(CFLAGS)
	
simple: $(OBJ)
	$(CC) -D DISABLE_WILDCARD -D DISABLE_INCLUDE -D DISABLE_EXTENSIONS -o $@ $^ $(CFLAGS)

.PHONY: clean
  
clean:
	rm -f $(ODIR)/*.o
	
.PHONY: cleanwin

cleanwin: 
	erase /f $(ODIR)/*.o