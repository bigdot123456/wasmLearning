INCDIR=../../../../include
LIBDIR=../../../../lib
run:  skypat_c
	LD_LIBRARY_PATH=$(LIBDIR) ./$<
skypat_c: main.cpp my_case.cpp
	$(CXX) -I$(INCDIR) -L$(LIBDIR) $^ -fno-rtti -lskypat -o $@
clean:
	rm -f  skypat_c

