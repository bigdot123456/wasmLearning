INCDIR=../../../../include
LIBDIR=../../../../lib
run:  smoke
	LD_LIBRARY_PATH=$(LIBDIR) ./$<
smoke: main.cpp my_case.cpp
	$(CXX) -I$(INCDIR) -L$(LIBDIR) $^ -fno-rtti -lskypat -o $@
clean:
	rm -f  smoke

