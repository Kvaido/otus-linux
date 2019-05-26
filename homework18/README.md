# Домашнее задание
разворачиваем сетевую лабораторию

# otus-linux
Vagrantfile - для стенда урока 18 - Network

# Дано
https://github.com/erlong15/otus-linux/tree/network
(ветка network)

Vagrantfile с начальным построением сети
- inetRouter
- centralRouter
- centralServer

тестировалось на virtualbox

# Планируемая архитектура
построить следующую архитектуру

Сеть office1
- 192.168.2.0/26 - dev
- 192.168.2.64/26 - test servers
- 192.168.2.128/26 - managers
- 192.168.2.192/26 - office hardware

Сеть office2
- 192.168.1.0/25 - dev
- 192.168.1.128/26 - test servers
- 192.168.1.192/26 - office hardware


Сеть central
- 192.168.0.0/28 - directors
- 192.168.0.32/28 - office hardware
- 192.168.0.64/26 - wifi

```
Office1 ---\
--------> Central -- IRouter --> internet
Office2----/
```
###Итого должны получится следующие сервера
- inetRouter
- centralRouter
- office1Router
- office2Router
- centralServer
- office1Server
- office2Server

# Теоретическая часть
- Найти свободные подсети
- Посчитать сколько узлов в каждой подсети, включая свободные
- Указать broadcast адрес для каждой подсети
- проверить нет ли ошибок при разбиении

### Найти свободные подсети
   * Сеть office1
     * Нет
   * Сеть office2
     * Нет
   * Сеть central
     * 192.168.0.16/28
     * 192.168.0.48/28
     * 192.168.0.192/25
### Посчитать сколько узлов в каждой подсети, включая свободные
   * Сеть office1
     * 192.168.2.0/26 - 62
     * 192.168.2.64/26 - 62
     * 192.168.2.128/26 - 62
     * 192.168.2.192/26 - 62
   * Сеть office2
     * 192.168.1.0/25 - 126
     * 192.168.1.128/26 - 62
     * 192.168.1.192/26 - 62
   * Сеть central
     * 192.168.0.0/28 - 14
     * 192.168.0.16/28 - 14
     * 192.168.0.32/28 - 14
     * 192.168.0.48/28 - 14
     * 192.168.0.64/26 - 30
     * 192.168.0.192/25 - 128
### Указать broadcast адрес для каждой подсети
   * Сеть office1
     * 192.168.2.0/26 - 192.168.2.63
     * 192.168.2.64/26 - 192.168.2.127
     * 192.168.2.128/26 - 192.168.2.191
     * 192.168.2.192/26 - 192.168.2.255
   * Сеть office2
     * 192.168.1.0/25 - 192.168.1.127
     * 192.168.1.128/26 - 192.168.1.191
     * 192.168.1.192/26 - 192.168.1.255
   * Сеть central
     * 192.168.0.0/28 - 192.168.0.15
     * 192.168.0.16/28 - 192.168.0.31
     * 192.168.0.32/28 - 192.168.0.47
     * 192.168.0.48/28 - 192.168.0.63
     * 192.168.0.64/26 - 192.168.0.191
     * 192.168.0.192/25 - 192.168.0.255
	 
# Практическая часть

выполнить vagrant up
(возможно необходимо будет выполнить на всех узлах systemctl restart network)