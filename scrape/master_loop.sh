#!/bin/bash

while read f; do
   y=$( python -c "print(str('$f').rstrip().split(',')[0])" )
   m=$( python -c "print(str('$f').rstrip().split(',')[1])" )
   d=$( python -c "print(str('$f').rstrip().split(',')[2])" )
   q=$( python -c "print(str('$f').rstrip().split(',')[3])" )
   ./download_unzip.sh $y $m $d $q
   echo $y,$m,$d,$q > currently_scraping.txt
   #python clean_csv.py
   python clean_csv_ips.py
   rm log$y$m$d.csv
#done <days.txt
done <missing_day.txt # Use this to get any missing days
