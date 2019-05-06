###########################################################
#Name: Blake Meyers(cssc0430, Red id: 819557369)
#Project: CS530 Assignment 3
#File: Makefile
#Notes: Allows for easy compilation of the program.
###########################################################

#variables
C=cc
CFLAGS = -ll -ly
YFLAGS = -d
NAME = -o exp

all: syntax semantics exp

syntax:
	yacc $(YFLAGS) syntax.y
	
semantics:
	flex semantics.l
	
	
exp:	
	$(C) lex.yy.c y.tab.c $(CFLAGS) $(NAME)
	export PATH="./:$PATH"

clean:
	rm exp
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
#######################[ EOF: Makefile ]###################
