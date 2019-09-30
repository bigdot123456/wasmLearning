INCDIR=../../../../include
LIBDIR=../../../../lib
run:  assertion
	LD_LIBRARY_PATH=$(LIBDIR) ./$<
assertion: main.cpp my_case.cpp
	$(CXX) -I$(INCDIR) -L$(LIBDIR) $^ -fno-rtti -lskypat -o $@
clean:
	rm -f  assertion

