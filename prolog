#!/bin/bash

cd ./HIPAA

str=`echo $1 | ../XSB/bin/xsb -e "['shh.pl']." 2>&1`

#basic shell script
#basic shell script
# have used | as delimiter so depends on the position of ans wrt to | ?-
aa=`echo $str | awk -F'|' '/End XSB/ {print $5}'`
ans=`echo $aa | awk '/ / {print $NF}'`

#Assumed all the rule writelns should have been delimited by ;
lastRec=`echo $aa | awk 'BEGIN { RS = ";" }; END{print NR}'`
bb=`echo $aa | awk -v LR="$lastRec" 'BEGIN { RS = ";" }; {if(NR < LR) {printf "Rule:%s <br>",$NF}}'`

cc=`echo "HIPAA says $ans <br> $bb"`
echo $cc
#echo $str

