#!/bin/bash

pid=`find /proc -maxdepth 1 -type d -name '[0-9]*' | sed 's/[/proc]*//' | awk '{print $0}'`

echo -e "PID \tTTY \tSTAT \tTIME \tCOMMAND"

for i in ${pid[@]};
do
        if [[ -d "/proc/$i" ]]; then
                cd /proc/$i
                SERVICE=`cat status | awk 'NR==1' | awk '{print $2}'`
                STAT=`cat stat | awk '{print $3}'`
                TIME=`cat stat | awk '{print $14 + $15}'`
                TTY=`cat stat | awk '{print $7}'`
                CMDCHK=$(tr -d '\0' <  /proc/$i/cmdline)
                if [[ -n "$CMDCHK" ]]; then
                        CMD=$CMDCHK
                else
                        CMD=$SERVICE
                fi
                echo -e "$i \t$TTY \t$STAT \t$TIME \t$CMD"

        fi
done