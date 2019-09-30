INCDIR=../../../../include
LIBDIR=../../../../lib
run:  thread
	LD_LIBRARY_PATH=$(LIBDIR) ./$<
thread: main.cpp
	$(CXX) -I$(INCDIR) -L$(LIBDIR) $^ -fno-rtti -lskypat -o $@
clean:
	rm -f  thread

