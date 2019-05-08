<!-----------------------------------------------------------------
 Name: Blake Meyers(cssc0430, Red id: 819557369)
 Project: CS530 Assignment 3
 File: README.md
 Notes: A README file describing the program and detailing its files.
--------------------------------------------------------------------->

# CS-530, Spring 2019 Assignment 3


### Developed by Blake Meyers (cssc0430, Red id: 819557369)

#### The Program:

    A language parser that takes in a text file, which contains a mixture of both good and bad statements. The program uses Flex and Bison to evaluate these statements and indicate whether they passed or failed the set grammar rules.

#### The BNF Grammar:

    <digit> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
    <op>    ::= + | - | % | / | *
    <id>    ::= <char> | <id> <char> | <id> <digit>
    <exp>   ::= <id> <op> <id> | <exp> <op> <id>| ( <exp> ) | <id> <op> ( <exp> )
    <ass>   ::= <id> = <exp> ;
    <input> ::= <ass> \n | <exp> \n | <input> <ass> \n | <input> <exp> \n | \n | <input> \n
 
#### Files Included:
**README.md**:

    A README file describing the program and detailing its files.

**semantics.l**:

    The file contains the semantic rules for the file inputs. This file will print each token and return the token identifiers for use in the syntax.y file grammar rules.

**syntax.y**:

     The file contains the grammar rules for the different acceptable statments in the input. This file will call a function to print a statment indicating whether each line passed or failed and provide a reason if it failed.

**Makefile**:

    Creates a compiled version of syntax.y and semantics.l called exp.
    
**ex1.txt**

     A file that was used to test the program and make sure that the grammar rules worked properly.
     
#### Compilation Instructions:
**Make Instructions:**

    make:
    	compiles the exp file

    make clean:
    	deletes the exp file, the lex.yy.c file, the y.tab.c file, and the y.tab.h file

**Running the Program:**

    exp <filename>

**NOTE:** <> are not part of the command.

#### Operating Instructions:
**Required Input**:

    The input filename needs to be named ex.txt

#### Significant Design Decisions:

    * All tokens are printed as they are encountered and this happens in the semantics.l file
    * Pass or fail statements are in semantics.l functions and called from the syntax.y file, after each line is finished reading
    * Each line is seperated in the output by "*'s" to make for easier reading

#### Extra features:

    Makefile also cleans the lex.yy.c file, the y.tab.c file, and the y.tab.h file in addition to the required exp.

#### Known Deficiencies and Bugs:
    * N/A
  
#### Lessons Learned:
    * It can be time consuming to learn new programs (flex and bison)
    * If your not sure, always ask for clarification from the professor
    * There's many great resources out there to help solve whatever problem you encounter
    * Starting programs well before the deadline is very helpful as it allows time for questions
    * Test program with all types of inputs
<!-----------------------------------------[ EOF: README.md ]--------------------------------->
