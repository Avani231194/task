#!/bin/bash

function dataType(){
var1=$1
expr $var1 + 0 >/dev/null 2>&1

if [[ $? -ne 0 && $? -ne 1  ]]  ; then
	echo "Variable is String"
else
	echo "Variable is Integer"
fi  
}
dataType $1
