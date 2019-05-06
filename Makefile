###########################################################
#Name: Blake Meyers(cssc0430, Red id: 819557369)
#Project: CS530 Assignment 3
#File: Makefile
#Notes: Allows for easy compilation of the program.
###########################################################

#variables
C=cc
CFLAGS = -ll -ly
YFLAGS = -y
NAME = -o exp

all: exp

exp:	semantics
	syntax
	$(C) lex.yy.c y.tab.c $(CFLAGS) $(NAME)
	export PATH="./:$PATH"

semantics:
	flex syntax.l
syntax:
	yacc $(YFLAGS) syntax.y

clean:
	rm exp
	rm lex.yy.c
	rm y.tab.c
  	rm y.tab.h
    
#######################[ EOF: Makefile ]###################
