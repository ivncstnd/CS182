#!/bin/bash

# Assuming JQF and this script are in the same parent directory
# Save the current directory
CURRENT_DIR=$(pwd)

# Set the classpath using JQF's classpath.sh script
CLASSPATH=$($CURRENT_DIR/JQF/scripts/classpath.sh)

# Check if the classpath was set correctly
if [ $? -ne 0 ]; then
    echo "Failed to set CLASSPATH using classpath.sh"
    exit 1
fi

# 2.1. Compile the PUT with essential dependencies using javac -cp
javac -cp "$CLASSPATH" $CURRENT_DIR/PUT/SimpleTest.java

if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi 

echo "Compilation successful"

# 2.2. Run jqf-random on the PUT bytecode for 10 iterations.
$CURRENT_DIR/JQF/bin/jqf-random -c "$CLASSPATH:$CURRENT_DIR/PUT/" SimpleTest testSimpleTest 10

# Check if jqf-random ran successfully
if [ $? -ne 0 ]; then
    echo "Fuzz test failed"
    exit 1
fi

echo "Fuzz test completed successfully"
