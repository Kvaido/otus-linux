#!/bin/bash

#Пользователь, которого наделим правами root
groupadd jrsysadmins
useradd jrsysadmin
usermod -a -G jrsysadmins jrsysadmin

#Обычные пользователи
groupadd simple
useradd masha
useradd dasha
usermod -a -G simple masha
usermod -a -G simple dasha

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config