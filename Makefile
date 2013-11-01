FILES=$(shell find . -maxdepth 1 -name "*.cpp" -or -name "*.c" | sed 's/\.\///' | sed 's/\.cpp/.o/' | sed 's/\.c/.o/')
BASEPATH=/home/lichak
LDFLAGS=-L$(BASEPATH)/libpolytools/ -lpolytools -Wl,--rpath $(BASEPATH)/libpolytools/
CXXFLAGS=-O2 -I$(BASEPATH)/libpolytools/include/ -Wall

all: $(FILES)
	gcc $(LDFLAGS) -o main $(FILES)	

%.o: %.cpp
	g++ $(CXXFLAGS) -c $< -o $@

%.o: %.c
	cc $(CXXFLAGS) -c $< -o $@
