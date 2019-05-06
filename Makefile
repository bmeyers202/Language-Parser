###########################################################
#Name: Blake Meyers(cssc0430, Red id: 819557369)
#Project: CS530 Assignment 3
#File: Makefile
#Notes: Allows for easy compilation of the program.
#
# Usage:
# make        compiles exectuable
# make clean  removes executable, header, and c files
###########################################################

#Variables
C=cc
CFLAGS = -ll -ly
YFLAGS = -d
NAME = -o exp

all: syntax semantics exp

#Generates the y.tab.h
syntax:
	@echo "Generating y.tab.h.."
	yacc $(YFLAGS) syntax.y

#Generates the y.tab.c
semantics:
	@echo "Generating y.tab.c.."
	flex semantics.l

#Generates the executable
exp:	
	@echo "Generating executable.."
	$(C) lex.yy.c y.tab.c $(CFLAGS) $(NAME)
	export PATH="./:$PATH"

#Removes the following files with "make clean" command to allow for a fresh compile
clean:
	@echo "Cleaning up..."
	rm exp
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
#######################[ EOF: Makefile ]###################
