#!/bin/bash

DATE=$(date +%Y%m%d)
crontab_files="/tmp/crontab_files/"
if [ ! -x $crontab_files ];then
    mkdir $crontab_files
fi
today_crontab=${crontab_files}crontab_${DATE}.bak
crontab -l > $today_crontab
find $crontab_files -mtime +15 -name "*.bak" -exec rm -rf {} \;