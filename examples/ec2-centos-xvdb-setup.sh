#!/bin/sh

# Create and mount a filesystem on CentOS with an
# xvdb shared volume as the btrfs filesystem.

# install dependencies
sudo yum install btrfs-progs

# format xvdb into btrfs filesystem
sudo mkfs -t btrfs /dev/xvdf

# create btrfs mount node
sudo mkdir -p '/var/shocker'

# mount btrfs filesystem onto mount node
sudo mount '/dev/xvdb' '/var/shocker'

# download shocker
curl -sL https://github.com/stamf/shocker/archive/master.tar.gz | tar xz

# mount cgroups
sudo service cgconfig start
