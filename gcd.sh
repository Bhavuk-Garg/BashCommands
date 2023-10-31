#! /bin/bash

gcd() {
    dividend=$1
    divisor=$2
    
    while [ $((dividend % divisor)) -ne 0 ]
    do
        temp=$((dividend % divisor))
        dividend=$divisor
        divisor=$temp
    done
    echo "dividend is $divisor"
}

E_MISSING_ARGS=34
E_NON_INTEGER=27

INTEGER_REGEX="^[0-9]*$"

if [ $# -lt 2 ] 
then 
    echo "Dividend and Divisor are required" 
    exit $E_MISSING_ARGS
elif ! [[ "$2" =~ $INTEGER_REGEX && "$1" =~ $INTEGER_REGEX ]]
then
    echo "Please enter an integer for both inputs $1 , $2"
    exit $E_NON_INTEGER
fi

gcd $1 $2

exit $?