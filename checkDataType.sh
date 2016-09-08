#!/bin/bash
echo "***********This Script Checks Datatype Of The Argument Passed To The Script, i.e. Weather It Is Integer Or String***********"
echo "Enter Your Input"
read number
if [[ $number =~ ^[-+]?[0-9]+$ ]]
then
 echo "Number $number is an Integer"
else
 echo "You provided a string"
fi
