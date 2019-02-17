#!/bin/bash

#Указываем переменные
SERVICE="squid"
WATCHDOG_LOG="/tmp/watchdog_service.log"

#Цикл проверки сервиса
while :
	do
	    #Проверяем запущен ли служба squid 
		ps aux| grep -v grep | grep squid > /dev/null
		#Передаем статус последней выподненной команды
		RESULT=$?
		#Начинаем сравнение
		if [ "${RESULT}" -eq "0" ] ; then
			echo "`date`: Служба $SERVICE работает штатно." | awk '{print $0}' >> $WATCHDOG_LOG
			sleep 2
		else
			echo "`date`: ВНИМАНИЕ!!! Служба $SERVICE не запущена! Запускаю!" | awk '{print $0}' >> $WATCHDOG_LOG
			#Читаем последнюю строку в журнале событий и передаем переменной
			ALARM=`tail -n 1 $WATCHDOG_LOG`
			#Отправляем письмо
			echo "$ALARM" | mail -s "PROXY IS DOWN" your@mail.ru
			#Перезапускаем службу squid
			systemctl restart squid
			sleep 2
		fi
		sleep 20
done;