# !/bin/bash

python /Users/fanmaoyu/Desktop/python/zbjClear.py

while true
do
	cat /Users/fanmaoyu/Desktop/python/index | (while read line;
    do
		if [ $line -eq 0 ];then
            exit 0
        else
            python /Users/fanmaoyu/Desktop/python/zbjSpider.py $line
        fi
    done)
done
