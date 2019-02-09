#!/bin/bash
#Скрипт для создания рейд массива 5-го уровня.

#Обнуление суперблоков
mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}

#Создание рейд массива уровня 5 из 5 дисков
mdadm --create --verbose /dev/md0 -l 5 -n 5 /dev/sd{b,c,d,e,f}

#Создание директории для конфигурационного файла
mkdir -p /etc/mdadm

#Создание и запись конфигурации в рейда массива mdadm.conf
echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf

#Создание таблицы разделов GTP в рейде
parted -s /dev/md0 mklabel gpt

#Создание двух партиций 
parted /dev/md0 mkpart primary ext4 0% 50%
parted /dev/md0 mkpart primary ext4 50% 100%

#Создание файловой системы EXT4 в партициях 
for i in $(seq 1 2); do mkfs.ext4 /dev/md0p$i; done

#Создание каталогов для каждой партиции
mkdir -p /raid/backup{1,2}

#Монтирование партиций в каталогах
for i in $(seq 1 2); do mount /dev/md0p$i /raid/backup$i; done