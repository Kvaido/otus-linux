1. Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни

Добавляем в /etc/pam.d/sshd строку  

account    required     pam_time.so

Добавляем в /etc/security/time.conf строку 

login;tty*&!ttyp*;!root;!Wk0000-2400

Которая запрещает всем пользователям, кроме root, заходить логиниться в выходные дни.

https://linux.die.net/man/5/time.conf
https://linux.die.net/man/8/pam_time

2. Дать конкретному пользователю права рута

Создать файл /etc/security/capability.conf если его нет и внести туда запись

cap_sys_admin    jrsysadmin

В файле /etc/pam.d/su добавить строку 

auth        optional    pam_cap.so

Запись должна быть выше чем pam_rootok.so


https://unix.stackexchange.com/questions/454708/how-do-you-add-cap-sys-admin-permissions-to-user-in-centos-7