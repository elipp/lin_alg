CC = g++ -march=native
CFLAGS = -c -fPIC -Wall -g -O2
BUILDDIR=build

all: linalg_sharedlib

linalg_sharedlib: 
	mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) lin_alg.cpp -o $(BUILDDIR)/lin_alg.o
	$(CC) -shared -o $(BUILDDIR)/liblinalg.so $(BUILDDIR)/lin_alg.o

install: linalg_sharedlib
	install -d /usr/lib
	install -m 755 $(BUILDDIR)/liblinalg.so /usr/lib
	install -m 644 lin_alg.h /usr/local/include

uninstall:
	rm /usr/lib/liblinalg.so
	rm /usr/local/include/lin_alg.h
