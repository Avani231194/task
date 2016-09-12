#!/bin/bash

inputfile=$1

awk '(!/^ *#/) && (!/^ *;/) || (/^ *#!/)' $inputfile | grep -v '^$'

