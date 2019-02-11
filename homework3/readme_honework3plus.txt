


#������� ���������� �������� ��� ������� /opt
pvcreate /dev/sdb

#������� ��� ��� /opt
vgcreate vg_opt /dev/sdb

#������� ���������� ������� ��� ������� /opt
lvcreate -n lv_opt -l 80%FREE /dev/vg_opt
WARNING: xfs signature detected on /dev/vg_opt/lv_opt at offset 0. Wipe it? [y/n]: y
  Wiping xfs signature on /dev/vg_opt/lv_opt.
  Logical volume "lv_opt" created.

#������� �������� ������� BTRFS
mkfs.btrfs /dev/vg_opt/lv_opt

#����������� ������ ������ /opt
umount /opt

#������������� �����
mount /dev/vg_opt/lv_opt /opt

#������� ������ � fstab ��� ��������������� ������������ /opt
echo "`blkid | grep opt | awk '{print $2}'` /opt btrfs defaults 0 0" >> /etc/fstab

#������� ������� �������
lvcreate -L 500MB -s -n opt_snap /dev/vg_opt/lv_opt

#�������� ����
lvcreate -n cachefs -L 1G /dev/vg_opt

#�������� ���� ����
lvcreate -n cachefsmeta -L 16M /dev/vg_opt

#�������� ������ � ���������� � ���
lvconvert --type cache-pool --poolmetadata /dev/vg_opt/cachefsmeta /dev/vg_opt/cachefs

#�������� ����� ���� � ������� /opt
lvconvert --type cache --cachepool /dev/vg_opt/cachefs /dev/vg_opt/lv_opt
