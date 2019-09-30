INCDIR=../../../../include
LIBDIR=../../../../lib
run:  performance
	LD_LIBRARY_PATH=$(LIBDIR) ./$<
performance: main.cpp my_case.cpp
	$(CXX) -I$(INCDIR) -L$(LIBDIR) $^ -fno-rtti -lskypat -o $@
clean:
	rm -f  performance

