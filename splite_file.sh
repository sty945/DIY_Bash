#!/bin/bash
    
if [ $# -ne 2 ];then 
        echo "U: sh $0 [file] [fnumber]" 
        echo "E: sh $0 myfile 3" 
        exit 1 
fi 
        
srcfile=$1 #原始文件 
fnumber=$2 #需要拆分的文件个数 
        
eval $(cat $srcfile | awk -vn=$fnumber 'END{print "total="NR,"fline="int(NR/n),"extra="NR%n,"cline="int(NR/n)+1}') 
# total:原始文件总行数 
# fline:拆分文件平均行数 
# extra:需要扩展行数的文件个数 
# cline:当前拆分文件行数 
        
i=0 
iline=1 
while true;do 
        filename="$srcfile.0$i" 
        # 按行的顺序分别写入文件中 
        if [ $extra = 0 ];then 
                echo "$filename lines: $fline" 
                tail -n +$iline $srcfile | head -n $fline > $filename 
                iline=$((iline+fline)) 
        else 
                echo "$filename lines: $cline" 
                tail -n +$iline $srcfile | head -n $cline > $filename 
                iline=$((iline+cline)) 
                extra=$((extra-1)) 
        fi  
        ((i++)) 
        [ $iline -ge $total ] && exit 0 
done