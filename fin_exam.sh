#!/bin/bash

read sequence

#counts the length of the given sequence
length=${#sequence}

#checks if the sequence is greater or equal to 3 and starts with ATG
if [ "$length" -ge 3 ] && [ "${sequence:0:3}" = "ATG" ]; then
    echo "ATG starting codon found."

    #checks every codon, starting from the fourth character
    for ((i = 3; i < length; i += 3)); do
        codon="${sequence:i:3}"

        #checks if the sequence ends with one of the ending codons TAA, TAG, TGA
        if [ "$codon" = "TAA" ] || [ "$codon" = "TAG" ] || [ "$codon" = "TGA" ]; then
            echo "Ending codon '$codon' found."
            exit 0
        fi
    done

    echo "Ending codon wasn't found."
else
    echo "The sequence does not start with starting codon ATG or it is too small."
fi

date
