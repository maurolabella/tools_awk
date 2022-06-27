#!/usr/bin/awk -f

BEGIN {FS=":"}

NR==1 {next;}
$3 ~ /M/ {masc[$2]=$1}
$3 ~ /F/ {fem[$2]=$1}

END {

print "\nMasculine Nouns\n--------------------";
	for (x in masc)
		{print x "--" masc[x]}
print "\nFeminine Nouns\n---------------------"
	for (y in fem)
		{print y "--" fem[y]}
}