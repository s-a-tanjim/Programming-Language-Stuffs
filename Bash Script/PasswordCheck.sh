# It will take password as input from terminal and output if password is weak or strong
# Condition of being strong
# 1. More than 8 character
# 2. Must contain at least 1 small letter [a-z]
# 3. Must contain at least 1 capital letter [A-Z]
# 4. Must contain at least 1 special character [@ # $ % & * + - =]

#!/usr/bin/bash

args=("$@")

len=${#args[0]}

pw=${args[0]}

numbcheck=$(echo "$pw" | grep -o -E '[0-9]+' )

lowercaseCheck=$(echo "$pw" | grep -o -E '[a-z]+' )
uppercaseCheck=$(echo "$pw" | grep -o -E '[A-Z]+' )
specialCharChek=$(echo "$pw" | grep "[@#$%&*+-=]")

if [ $len -lt 8 ]
then
  echo "Weak password!"
  exit 1
elif [ -z "$numbcheck" ]
then
  echo "Weak password!"
elif [ -z "$specialCharChek" ]
then
  echo "Weak password!"
else
  echo "Strong password!"
fi
