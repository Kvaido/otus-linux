# Инструкции

* [Как начать Git](git_quick_start.md)
* [Как начать Vagrant](vagrant_quick_start.md)

## otus-linux

Используйте этот [Vagrantfile](Vagrantfile) - для тестового стенда.

---------------------
# Домашнее задание №2

# Система самостоятельно собирает raid5, создает файловую систему, монтирует директории.

В файл Vagrantfile был отредактирован и подключен пятый диск

        },
		:sata5 => {
		    :dfile => home + '/VirtualBox VMs/disks/sata5.vdi',
			:size => 250,
			:port => 5
		}	
		
Добавлены строки, с командами.

box.vm.provision "shell", path: "make_raid.sh"
box.vm.provision "shell", path: "raid_test.sh"

make_raid.sh собирает рейд, делит на две партиции, задает ФС и монтирует к корню.
raid_test.sh создает файл в одном из каталогов и командой echo записывает туда сообщение тем самым подтверждая, что рейд собран и функционирует.