INCDIR=../../../../include
LIBDIR=../../../../lib
run:  fail
	LD_LIBRARY_PATH=$(LIBDIR) ./$<
fail: main.cpp my_case.cpp
	$(CXX) -I$(INCDIR) -L$(LIBDIR) $^ -fno-rtti -lskypat -o $@
clean:
	rm -f  fail

