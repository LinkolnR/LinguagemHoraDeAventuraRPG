#!/bin/bash

# Define file names
BISON_FILE="vdc.y"
FLEX_FILE="vdc.l"
PARSER_C_FILE="parser.c"
PARSER_H_FILE="parser.h"
SCANNER_C_FILE="scanner.c"
OUTPUT_EXEC="parser"

# Step 1: Run Bison to generate parser.c and parser.tab.h
bison -d -o  $PARSER_C_FILE $BISON_FILE -Wcounterexamples
if [ $? -ne 0 ]; then
    echo "Bison failed"
    exit 1
fi

# Step 2: Run Flex to generate scanner.c
flex -o $SCANNER_C_FILE $FLEX_FILE
if [ $? -ne 0 ]; then
    echo "Flex failed"
    exit 1
fi

# Step 3: Compile the generated C files and link them
gcc -o $OUTPUT_EXEC $PARSER_C_FILE $SCANNER_C_FILE -lfl
if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi

# Step 4: Print success message
echo "Compilation successful. Executable created: $OUTPUT_EXEC"
