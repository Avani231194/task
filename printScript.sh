#!/bin/bash
scriptFile=$1
awk '{ if( ($0 !~ /^ *#/) || ($0 ~ /^ *#!/) ) print $0 ; else  {gsub(/^ *#.*/ , "" ); print } } ' $scriptFile
