###########################################################
#Name: Blake Meyers(cssc0430, Red id: 819557369)
#Project: CS530 Assignment 3
#File: Makefile
#Notes: Allows for easy compilation of the program.
###########################################################

#variables
CC=g++

all: exp
	$(CC) lex.yy.c y.tab.c -ll -ly -o exp
	export PATH="./:$PATH"

clean:
	rm rf exp
	rm lex.yy.c
	rm y.tab.c
  rm y.tab.h
    
#######################[ EOF: Makefile ]###################
