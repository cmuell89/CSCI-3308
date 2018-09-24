#!/bin/bash

# Matthew Strong and Satish Upadhyaya Section 205
if [[ $1 == '' ]]
then
	echo -e "Usage: RegexAnswers.sh filename"

else
	echo -n "1. " 
	echo $(grep -E '[0-9]$' $1 | wc -l)
	echo -n "2. "
	echo $(grep -E '^[aeiouAEIOU]' $1 | wc -l)
	echo -n "3. "
	echo $(grep -E '^[A-Za-z]{9}$' $1 | wc -l)
	echo -n "4. "
	echo $(grep -E '^[0-9]{3}-[0-9]{3}-[0-9]{4}$' $1 | wc -l)
	echo -n "5. "
	echo $(grep -E '^303-[0-9]{3}-[0-9]{4}$' $1 | wc -l)
	echo -n "6. "
	echo $(grep -E '^[0-9].*[aeiouAEIOU]$' $1 | wc -l)
	echo -n "7. "
	echo $(grep -E 'UCDenver.edu$' $1 | wc -l)
	echo -n "8: "
	echo $(grep -E  '^[n-zN-Z][a-zA-Z]*\.[a-zA-Z\-]+@' $1 | wc -l)
fi





