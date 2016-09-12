# This Script will check dataType passed as an argument in Shell.
# It will only check for Sting, Integer and Float Datatype.
# Syntax :  bash dataType.sh "argument"

#!/usr/bin/env bash
arg=$1

if [[ $arg =~ ^[+-]?([0-9]+)$ ]]
   then
      echo "This is a INTEGER TYPE  w/o decimal."
else
    if [[ $arg =~ ^[+-]?([0-9]+\.)$ ]]
       then
          echo " No Integer added after the decimal , please provide corrent intput."
     else
         if [[ $arg =~ ^[+-]?([0-9]+\.[0-9]+)$ ]]
                              then
                                 echo "This is a Floating TYPE."
         else
             echo " This is a STRING TYPE."
        fi
    fi
fi
