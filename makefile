CC=g++

CPPFLAGS = -g -Wall -O3


boss: main.o scaffoldgraph.o scaffolding.o
	$(CC) -o $@ $^ ./lp/liblpsolve55.a -lm -ldl -I $(BAMTOOLS_HOME)/include/bamtools -L $(BAMTOOLS_HOME)/lib -lbamtools -std=gnu++98 -lz

main.o: main.cpp scaffoldgraph.h scaffolding.h
	$(CC) -c main.cpp -I $(BAMTOOLS_HOME)/include/bamtools -L $(BAMTOOLS_HOME)/lib -lbamtools -std=gnu++98 -lz
	
scaffoldgraph.o: scaffoldgraph.cpp scaffoldgraph.h
	$(CC) -c scaffoldgraph.cpp -I $(BAMTOOLS_HOME)/include/bamtools -L $(BAMTOOLS_HOME)/lib -lbamtools -std=gnu++98 -lz
	
scaffolding.o: scaffolding.cpp scaffoldgraph.h scaffolding.h
	$(CC) -c scaffolding.cpp -I $(BAMTOOLS_HOME)/include/bamtools -L $(BAMTOOLS_HOME)/lib -lbamtools -std=gnu++98 -lz
	

all: boss
	rm -f *.o

clean:
	rm -f *.o
	rm boss
