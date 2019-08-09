mkdir -p /etc/dpkg/dpkg.cfg.d
cat >/etc/dpkg/dpkg.cfg.d/01_nodoc <<EOF
path-exclude /usr/share/doc/*
path-include /usr/share/doc/*/copyright
path-exclude /usr/share/man/*
path-exclude /usr/share/groff/*
path-exclude /usr/share/info/*
path-exclude /usr/share/lintian/*
path-exclude /usr/share/linda/*
EOF

export DEBIAN_FRONTEND=noninteractive
export APTARGS="-qq -o=Dpkg::Use-Pty=0"

# use mirrors
sudo sed -i -e 's/http:\/\/us.archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list

apt-get clean ${APTARGS}
apt-get update ${APTARGS}

apt-get upgrade -y ${APTARGS}
apt-get dist-upgrade -y ${APTARGS}

# Update to the latest kernel
apt-get install -y linux-generic linux-image-generic ${APTARGS}

# basic tools
apt-get install -y  curl wget jq tar unzip redis-server python3-pip python3-dev libpq-dev nginx tree vim ${APTARGS}

# for docker devicemapper
apt-get install -y thin-provisioning-tools ${APTARGS}

# add user_subvol_rm_allowed to fstab 
# if /var/lib is btrfs
sed -i -e 's/\/var\/lib.*.btrfs.*.defaults.*.0/\/var\/lib\tbtrfs\tdefaults,user_subvol_rm_allowed\t0/g' /etc/fstab


# Hide Ubuntu splash screen during OS Boot, so you can see if the boot hangs
apt-get remove -y plymouth-theme-ubuntu-text
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT=""/' /etc/default/grub
update-grub

# Reboot with the new kernel
shutdown -r now
