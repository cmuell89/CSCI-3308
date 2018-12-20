#!/bin/bash

# Matthew Strong and Satish Upadhyaya Section 205

if [[ $1 == '' ]]
then
	echo -e "Usage: TimesAwk.sh filename"
else
	sort -k3,3 -k2,2 -k1,1 $1 > 'testing.txt'
	awk '{ x=$4; y=$5; z=$6; a=$1; b=$2; c=$3 } { print a" " "["((x+y+z)/3)"] " c", "b}' 'testing.txt'
	rm 'testing.txt'
fi
