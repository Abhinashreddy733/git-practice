#! /bin/bash

# Size starts from 0, size is 3

FRUITS=("Apple" "KIWI" "ORANGE") # Array

echo "First fruit is: ${FRUITS[0]}"
echo "Second fruit is: ${FRUITS[1]}"
echo "Third fruit is: ${FRUITS[2]}"

echo "All fruits are: ${FRUITS[@]}"