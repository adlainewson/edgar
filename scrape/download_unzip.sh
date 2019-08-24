# Download the daily file and extract it
# Args:
# $1: year
# $2: month
# $3: day
# $4: quarter 

# Data available at: https://www.sec.gov/data/edgar-log-file-data-set.html
# example query: http://www.sec.gov/dera/data/Public-EDGAR-log-file-data/2016/Qtr2/log20160630.zip

#!/bin/bash
echo Downloading $1-$2-$3 . . . 
wget --retry-connrefused --waitretry=10 https://www.sec.gov/dera/data/Public-EDGAR-log-file-data/$1/Qtr$4/log$1$2$3.zip
unzip -o log$1$2$3.zip
rm log$1$2$3.zip
