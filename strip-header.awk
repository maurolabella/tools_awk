#!/usr/bin/awk -f
# both cat test1.txt | ./strip-header.awk 
#and ./strip-header.awk test1.txt  are possible

BEGIN {FS=":"}

NR==1 {next;}
$3 == "M" {print;count++;}

END { print "The number of masculine nouns are ", count}
