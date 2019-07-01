#!/bin/bash
#create and store in an array, the current classes that exist on this machine in particular 
readarray -t class < <(sudo lshw -quiet -json | grep class | awk -F":" '{ print $2 }' | tr -d '",' | uniq)
echo "Select a class"
#dynamically create a menu to select the class you want more detail on
select choice in "${class[@]}"
do
#get yer details here!
 sudo lshw -quiet -c $choice
break
#fin
done