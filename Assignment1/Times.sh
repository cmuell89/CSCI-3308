
#!/bin/bash
# Matthew Strong and Satish Upadhyaya Section 205

# 
if [[ $1 == '' ]]
then
	echo -e "Usage: Times.sh filename"
else
	athletes=$1
	sort -k3,3 -k2,2 -k1,1 $1 > 'testing.txt'

	while read -r first second third fourth fifth sixth; do
 	 a=$fourth
 	 b=$fifth
 	 c=$(echo $sixth | tr -d '\r')
  	ans=$((( a + b + c ) / 3 ))

  	echo  "${first} [${ans}] ${third}, ${second}"

	done < 'testing.txt'
	rm 'testing.txt'
fi


