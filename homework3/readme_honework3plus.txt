


#Создаем физический уровнень для раздела /opt
pvcreate /dev/sdb

#Создаем том для /opt
vgcreate vg_opt /dev/sdb

#Создаем логический уровень для раздела /opt
lvcreate -n lv_opt -l 80%FREE /dev/vg_opt
WARNING: xfs signature detected on /dev/vg_opt/lv_opt at offset 0. Wipe it? [y/n]: y
  Wiping xfs signature on /dev/vg_opt/lv_opt.
  Logical volume "lv_opt" created.

#Создаем файловую систему BTRFS
mkfs.btrfs /dev/vg_opt/lv_opt

#Отмонтируем старый раздел /opt
umount /opt

#Принмонтируем новый
mount /dev/vg_opt/lv_opt /opt

#Заносим запись в fstab для автоматического монтирования /opt
echo "`blkid | grep opt | awk '{print $2}'` /opt btrfs defaults 0 0" >> /etc/fstab

#Создаем спаншот раздела
lvcreate -L 500MB -s -n opt_snap /dev/vg_opt/lv_opt

#Создания кеша
lvcreate -n cachefs -L 1G /dev/vg_opt

#Создание кеша мета
lvcreate -n cachefsmeta -L 16M /dev/vg_opt

#Создание данных и метаданных в пул
lvconvert --type cache-pool --poolmetadata /dev/vg_opt/cachefsmeta /dev/vg_opt/cachefs

#Создание связи кеша и раздела /opt
lvconvert --type cache --cachepool /dev/vg_opt/cachefs /dev/vg_opt/lv_opt
