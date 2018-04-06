#!/bin/sh

# description: Sort the files in your directory by size, and Display their storage size directly
# user: sty
# blog: https://blog.csdn.net/sty945
# github: https://github.com/sty945/DIY_Bash


du -s * | sort -nr | awk -F'\t' '{if(1024 * 1024 * 1024 * 1024 > $1 && $1 >= 1024 * 1024 * 1024) {printf "%.2fT\t\t %-2s\n", $1/(1024 * 1024 * 1024), $2} else if(1024 * 1024 * 1024 > $1 && $1 >= 1024 * 1024) {printf "%.2fG\t\t %-2s\n", $1/(1024 * 1024), $2} else if (1024 * 1024 > $1 && $1 >= 1024) {printf "%.2fM\t\t %-2s\n", $1/1024, $2} else {printf "%sk\t\t %-2s\n", $1, $2}}' 

