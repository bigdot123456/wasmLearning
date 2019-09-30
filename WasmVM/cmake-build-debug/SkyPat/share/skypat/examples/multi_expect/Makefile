INCDIR=../../../../include
LIBDIR=../../../../lib
run:  multi_expect
	LD_LIBRARY_PATH=$(LIBDIR) ./$<
multi_expect: main.cpp my_case.cpp
	$(CXX) -I$(INCDIR) -L$(LIBDIR) $^ -fno-rtti -lskypat -o $@
clean:
	rm -f  multi_expect

