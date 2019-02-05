#! /bin/bash
sudo su
mdadm --create --verbose /dev/md0 -l 5 -n 5 /dev/sd{b,c,d,e,f}
parted -s /dev/md0 mklabel gpt
parted /dev/md0 mkpart primary ext4 0% 50%
parted /dev/md0 mkpart primary ext4 50% 100%
for i in $(seq 1 2); do mkfs.ext4 /dev/md0p$i; done
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm.conf
mkdir -p /raid/backup{1,2}
for i in $(seq 1 2); do mount /dev/md0p$i /raid/backup$i; done