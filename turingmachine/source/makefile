IDIR=include
CC=g++
CFLAGS=-I$(IDIR) -std=c++17
DEFS=-D DISABLE_TOY


ODIR = obj

_DEPS = state.h turingmachine.h transition.h tape.h support.h tmsimfunc.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = support.o tape.o transition.o state.o turingmachine.o tmsimfunc.o tmsim.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.cpp $(DEPS)
	$(CC) $(DEFS) -c $(CFLAGS) $< -o $@
	
#set the defines in a variable
	
tm: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
	
toy: support.cpp tape.cpp transition.cpp state.cpp turingmachine.cpp tmsimfunc.cpp tmsim.cpp $(DEPS)
	$(CC) -c $(CFLAGS) support.cpp -o obj/support.o
	$(CC) -c $(CFLAGS) tape.cpp -o obj/tape.o 
	$(CC) -c $(CFLAGS) transition.cpp -o obj/transition.o
	$(CC) -c $(CFLAGS) state.cpp -o obj/state.o
	$(CC) -c $(CFLAGS) turingmachine.cpp -o obj/turingmachine.o
	$(CC) -c $(CFLAGS) tmsimfunc.cpp -o obj/tmsimfunc.o
	$(CC) -c $(CFLAGS) tmsim.cpp -o obj/tmsim.o
	$(CC) -o $@ $(OBJ) $(CFLAGS)
	
simpletm: support.cpp tape.cpp transition.cpp state.cpp turingmachine.cpp tmsimfunc.cpp tmsim.cpp $(DEPS)
	$(CC) -D DISABLE_TOY -D DISABLE_EXTENSIONS -D DISABLE_INCLUDE -D DISABLE_WILDCARD -c $(CFLAGS) support.cpp -o obj/support.o
	$(CC) -D DISABLE_TOY -D DISABLE_EXTENSIONS -D DISABLE_INCLUDE -D DISABLE_WILDCARD -c $(CFLAGS) tape.cpp -o obj/tape.o 
	$(CC) -D DISABLE_TOY -D DISABLE_EXTENSIONS -D DISABLE_INCLUDE -D DISABLE_WILDCARD -c $(CFLAGS) transition.cpp -o obj/transition.o
	$(CC) -D DISABLE_TOY -D DISABLE_EXTENSIONS -D DISABLE_INCLUDE -D DISABLE_WILDCARD -c $(CFLAGS) state.cpp -o obj/state.o
	$(CC) -D DISABLE_TOY -D DISABLE_EXTENSIONS -D DISABLE_INCLUDE -D DISABLE_WILDCARD -c $(CFLAGS) turingmachine.cpp -o obj/turingmachine.o
	$(CC) -D DISABLE_TOY -D DISABLE_EXTENSIONS -D DISABLE_INCLUDE -D DISABLE_WILDCARD -c $(CFLAGS) tmsimfunc.cpp -o obj/tmsimfunc.o
	$(CC) -D DISABLE_TOY -D DISABLE_EXTENSIONS -D DISABLE_INCLUDE -D DISABLE_WILDCARD -c $(CFLAGS) tmsim.cpp -o obj/tmsim.o
	$(CC) -o $@ $(OBJ) $(CFLAGS)
	
silenttm: support.cpp tape.cpp transition.cpp state.cpp turingmachine.cpp tmsimfunc.cpp tmsim.cpp $(DEPS)
	$(CC) -D DISABLE_TOY -D DISABLE_OUTPUT -D DISABLE_WARNINGS -c $(CFLAGS) support.cpp -o obj/support.o
	$(CC) -D DISABLE_TOY -D DISABLE_OUTPUT -D DISABLE_WARNINGS -c $(CFLAGS) tape.cpp -o obj/tape.o 
	$(CC) -D DISABLE_TOY -D DISABLE_OUTPUT -D DISABLE_WARNINGS -c $(CFLAGS) transition.cpp -o obj/transition.o
	$(CC) -D DISABLE_TOY -D DISABLE_OUTPUT -D DISABLE_WARNINGS -c $(CFLAGS) state.cpp -o obj/state.o
	$(CC) -D DISABLE_TOY -D DISABLE_OUTPUT -D DISABLE_WARNINGS -c $(CFLAGS) turingmachine.cpp -o obj/turingmachine.o
	$(CC) -D DISABLE_TOY -D DISABLE_OUTPUT -D DISABLE_WARNINGS -c $(CFLAGS) tmsimfunc.cpp -o obj/tmsimfunc.o
	$(CC) -D DISABLE_TOY -D DISABLE_OUTPUT -D DISABLE_WARNINGS -c $(CFLAGS) tmsim.cpp -o obj/tmsim.o
	$(CC) -o $@ $(OBJ) $(CFLAGS)
	
	
	
.PHONY: clean
  
clean:
	rm -f $(ODIR)/*.o
	rm -f tm
	rm -f simpletm
	rm -f toytm
	rm -f silenttm
	
.PHONY: cleanwin

cleanwin: 
	erase /f $(ODIR)/*.o
	erase /f tm.exe