# It will rename all the .text files to 1.txt, 2.txt, 3.txt ...

#!/usr/bin/bash

i=1

for entry in `ls $(pwd)`
do
  textCheck=$(echo "$entry" | grep ".txt")
  #echo $textCheck
  if [ -z $textCheck ]
  then
    continue
  fi
  newName=$i".txt"
  $(mv -- $entry $newName)
  i=$(( i+1 ))
  #echo $entry
  #echo $newName
  echo "file Renamed!"
done