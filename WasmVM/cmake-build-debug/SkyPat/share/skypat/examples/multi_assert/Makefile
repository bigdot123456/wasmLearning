INCDIR=../../../../include
LIBDIR=../../../../lib
run:  multi_assert
	LD_LIBRARY_PATH=$(LIBDIR) ./$<
multi_assert: main.cpp my_case.cpp
	$(CXX) -I$(INCDIR) -L$(LIBDIR) $^ -fno-rtti -lskypat -o $@
clean:
	rm -f  multi_assert

