#!/bin/bash
read filename
cat $filename | tr -s ' ' |sed 's/./& /g'|  tr ' ' '\n' | sort | uniq -c


