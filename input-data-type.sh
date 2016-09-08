#!/bin/bash

echo $1 | grep '^[0-9]*$' > /dev/null 2>&1
intcheck="$?"
echo $1 | grep '^[0-9]*.[0-9]*$' > /dev/null 2>&1
floatcheck="$?"

if [[ $intcheck == 0 ]]
then
        echo "Input is integer"
        elif [[ $floatcheck == 0 ]]
                then
                        echo "Input is float"
                else
                        echo "Input is string"
fi

