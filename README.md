# tools_awk
# general format of an awk script
#
# awk -f script file / -f allows me to receive a script from a file to implement 'awking' to a file (file)

#BEGIN { action(s) }  ---> Do these things before the line-by-line processing>
#pattern { action }  |
#pattern { action }  |
................     | ----> For each line (record), check against
                     |       the given pattern in the given order;
                     |       if a match, perform the corresponding action

END { action(s)}     |       after line by line processing: "tear down"			 

RS="\n" - record separator by default
FS='any number of space/tab chars' 
OFS = output file separator, used in the output (it allows you to chose it). It will be printed whenever you use the comma when printing, for instance print $2,"something", $5 ...NR
ORS = output register separator (similarly to OFS in which awk allows you to choose it which implement in output)
~ "contains"
NR - register number
NF - final field ($NF)
FILENAME - file name

----------------------------------------------------------------------
example of a command line awd instruction (for /etc/passwd)

awk -F ":" '{print $1}' /etc/passwd   - retrieves first column (users)

awk 'BEGIN{ FS = ":"; OFS = "-"} {print $1, $6, $7}' /etc/passwd

awk -F "/" '/^\// {print $NF}' /etc/shells

ps -ef | awk '{ if($NF == "bash") print $0}'

awk 'BEGIN { for(i=1;i<10; i++) print "The square root of", i , "is", i*i;}'

ps -ef|awk '$2 ~ /^d*9$/ {print $0}'

ps -ef | awk '{ if($2 ~ /^7.*/) print $0}'

 awk '{print substr($0, 4,5)}' /etc/passwd

#character position related to the first find (RSTART)
awk 'match($0, /o/) {print $0 "has \"o\" character at " RSTART}' /etc/passwd

awk 'match($4, /o/) {print $0 "has \"o\" character at " RSTART}' test.txt

df | awk 'NR==7, NR==9 {print NR, $0}'

awk '$2 > 259 && $2 !~ /Dat/ {print $0}' test.txt 

awk '$2 > 259 || $2 !~ /Dat/ {print $0}' test.txt 

#strange aproximation to range (it will initiate where the 
first coincidence and end up with the last)

awk ' $2==259, $3 ~/^h.*/ {print $0}' test.txt

awk ' BEGIN {print "records are processing"} $2==259, $3 ~/^h.*/ {print $0}' test.txt

awk ' BEGIN {print "records are processing"} $2==259, $3 ~/^h.*/ {print $0, $NR, $NF} END {print "the end"}' test.txt

awk ' BEGIN {print "records are processing"} $2==259, $3 ~/^h.*/ {print $0,NR,$NF } END {print "the end"}' test.txt

awk 'NR==4, NR==6 {print $0}' test.txt | awk '$4 ~/^eleph/'






