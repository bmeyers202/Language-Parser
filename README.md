<!-----------------------------------------------------------------
 Name: Blake Meyers(cssc0430, Red id: 819557369)
 Project: CS530 Assignment 3
 File: README.md
 Notes: A README file describing the program and detailing its files.
--------------------------------------------------------------------->

# CS-530, Spring 2019 Assignment 3


### Developed by Blake Meyers (cssc0430, Red id: 819557369)

#### The Program:
    A language parser that takes in a file named ex.txt, which contains a mixture of both good and bad statements. The program uses Flex and Bison
    to evaluate these statements and indicate whether they passed or failed the set grammar rules.

#### Files Included:
**README.md**:

    A README file describing the program and detailing its files.

**semantics.l**:

    The file cointains an algorithm that opens an SIC/XE object file and its accompanying symbol file, which then disassembles the object code, and generate an SIC/XE source file, and SIC/XE listing file using the assembled code.

**syntax.y**:

    Declares and briefly explains functions implemented in xed.cpp.

**Makefile**:

    Creates a compiled version of exp.cpp.

#### Compilation Instructions:
**Make Instructions:**

    make all:
    	compiles the exp file

    make clear:
    	deletes the exp file, the lex.yy.c file, the y.tab.c file, and the y.tab.h file

**Running the Program:**

    exp <filename>

**NOTE:** <> are not part of the command.

#### Operating Instructions:
**Required Input**:

    The input filename needs to be named ex.txt

#### Significant Design Decisions:
    All tokens are printed as they are encountered and this happens in the semantics.l file.
    All statments indicated whether each line passed or failed happens in the syntax.y file, after each line is finished
    reading.
    Error flags are set in the semantics.l file to communicate errors with the syntax.y file

#### Extra features:

    Makefile also cleans the lex.yy.c file, the y.tab.c file, and the y.tab.h file in addition to the required exp.

#### Known Deficiencies and Bugs:
**Known Bugs and Deficiencies**
* Pass/Fail statements are not right justified.
  
#### Lessons Learned:
* It can be time consuming to learn new programs (flex and bison)
* If your not sure, always ask for clarification from the professor
* There's many great resouces out there to help solve whatever problem you encounter
* Starting programs well before the deadline is very helpful
* Test program with all types of inputs
<!-----------------------------------------[ EOF: README.md ]--------------------------------->
