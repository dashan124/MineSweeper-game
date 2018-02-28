#!/bin/bash
size=0
n=10
m=10
mine=12
mine2=$mine
i=0
j=0
k=0
min=0
mi=0
se=0
sec=0
r=0
clear

declare -A table
declare -A duptable
for((i=0;i<n;i++))
do
for((j=0;j<m;j++))
do
table[$i,$j]=0
duptable[$i,$j]=0
done
done
i=0
j=0
d=0

ConstructTable()
{

#place mines
while ((mine>0))
do
z=`expr $n - 1`
r=$(shuf -i 0-$z -n 1)
c=$(shuf -i 0-$z -n 1)
if [ ${table[$r,$c]} != -1 ]
then
table[$r,$c]=-1
((mine--))
fi
done

#update table
for((i=0;i<n;i++))
do
for((j=0;j<m;j++))
do
if ((table[$i,$j] == -1))
then

	for((x=-1;x<=1;x++))
	do
	for((y=-1;y<=1;y++))
	do
		d=$((i+x))
		e=$((j+y))
		if ((d>-1 && d<n && e>-1 && e<m && table[$d,$e] != -1))
		then
		((table[$d,$e]++))
		fi
	done
	done

fi
done
done
}

CheatView()
{
#ViewTable-test
clear
echo
echo -e "\t\t\t\t    \033[32m$n X $m GRID ----- $mine2 MINEs\033[0m \n"
echo
echo -ne " \t\t\t \033[33mcol\033[0m\t "
for((i=0;i<m;i++))
do
echo -ne " \033[33m$i\033[0m  "
done
echo
echo
for((i=0;i<n;i++))
do
echo -ne "\t\t\t\033[33mrow $i\033[0m \t "
for((j=0;j<m;j++))
do
if((table[$i,$j]==0))
then
/bin/echo -ne "\e[0;37m . \e[0m "
elif((table[$i,$j]==1))
then
/bin/echo -ne "\e[1;34m ${table[$i,$j]} \e[0m "
elif((table[$i,$j]==2))
then
/bin/echo -ne "\e[1;32m ${table[$i,$j]} \e[0m "
elif((table[$i,$j]==3))
then
/bin/echo -ne "\e[1;35m ${table[$i,$j]} \e[0m "
elif((table[$i,$j]==4))
then
/bin/echo -ne "\e[1;33m ${table[$i,$j]} \e[0m "
elif((table[$i,$j]==5))
then
/bin/echo -ne "\e[0;34m ${table[$i,$j]} \e[0m "
elif((table[$i,$j]==6))
then
/bin/echo -ne "\e[0;32m ${table[$i,$j]} \e[0m "
elif((table[$i,$j]==7))
then
/bin/echo -ne "\e[0;35m ${table[$i,$j]} \e[0m "
elif((table[$i,$j]==8))
then
/bin/echo -ne "\e[0;33m ${table[$i,$j]} \e[0m "
elif((table[$i,$j]==-1))
then
/bin/echo -ne " \e[36;7m@\e[0m  "
fi
done
echo
echo
done
echo
}

ViewTable()
{
min=`date +"%M"`
sec=`date +"%S"`
clear
echo
echo -e "\t\t\t\t    \033[32m$n X $m GRID ----- $mine2 MINEs\033[0m \n"
echo
echo -ne " \t\t\t \033[33mcol\033[0m\t "
for((i=0;i<m;i++))
do
echo -ne " \