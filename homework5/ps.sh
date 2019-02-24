#!/bin/bash

#Вычисляем все PID номера в каталоге /proc
PID=`find /proc -maxdepth 1 -type d -name '[0-9]*' | sed 's/[/proc]*//' | awk '{print $0}'`

echo -e "PID \tTTY \tSTAT \tTIME \tCOMMAND"

#Запускаем цикл, где проходим по всему списку переменной $PID и читаем файлы stat и status
for i in ${PID[@]};
do
		#Проверяем на наличие каталога. Если есть, то продолжаем
        if [[ -d "/proc/$i" ]]; then
                cd /proc/$i
                SERVICE=`cat status | awk 'NR==1' | awk '{print $2}'`
                STAT=`cat stat | awk '{print $3}'`
                TIME=`cat stat | awk '{print $14 + $15}'`
                TTY=`cat stat | awk '{print $7}'`
                CMD=$(tr -d '\0' <  /proc/$i/cmdline)
                #Выводим полученные данные
				echo -e "$i \t$TTY \t$STAT \t$TIME \t$SERVICE$CMD"

        fi
done
