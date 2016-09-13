#!/bin/bash
file="file_name"
cat $file | tr " " "\n" | sort | uniq -c | sort -gr | xargs    #Show all unique word & space without ,

#xargs | sed -e 's/ /,/g'   #use for , purpose
