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
FCC = flex
YCC = yacc
CFLAGS = -ll -ly
YFLAGS = -d
NAME = -o exp

all: syntax semantics exp

#Generates the y.tab.h
syntax:
	@echo "Generating y.tab.h.."
	$(YCC) $(YFLAGS) syntax.y

#Generates the y.tab.c
semantics:
	@echo "Generating y.tab.c.."
	$(FCC) semantics.l

#Generates the executable
exp:	
	@echo "Generating y.tab.c.."
	$(C) lex.yy.c y.tab.c $(CFLAGS) $(NAME)

#Removes the following files with "make clean" command to allow for a fresh compile
clean:
	@echo "Cleaning up..."
	rm exp lex.yy.c y.tab.c y.tab.h
#######################[ EOF: Makefile ]###################
