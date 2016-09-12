#!/bin/bash
file="file_path/name"
sed -e 's/#[ ,a-z,1-100].*//' $file
