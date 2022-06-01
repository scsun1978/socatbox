#!/bin/bash

mypath="/opt/tigertms/"
myFile1="/opt/tigertms/socat5010.log"
myFile2="/opt/tigertms/socat15374.log"
myFile3="find /opt/tigertms/ -name socat1752*.log"
myFile4="/opt/tigertms/socat50001.log"

echo "读取5010日志"
LINE=1

while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
    ((LINE++))
	done < "$myFile1"

echo "读取5010日志完成"

read -p "Press any key to continue... " -n1 -s

echo "读取15374日志"
LINE=1

while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "$myFile2"

echo "读取15374日志完成"

read -p "Press any key to continue... " -n1 -s

echo "读取1752日志"
LINE=1

while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "$myFile3"

echo "读取1752日志完成"

read -p "Press any key to continue... " -n1 -s

echo "读取50001日志"
LINE=1

while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "$myFile1"

echo "读取50001日志完成"

read -p "Press any key to Finish... " -n1 -s