#!/bin/bash


function check_if_sudo {
if (( $EUID != 0))
then echo -e "\e[1;91mRun script with root privileges\e[0m"
exit
fi
}

# fix no WSMan
function WSMan_debian{
cd /usr/lib/x86_64-linux-gnu
sudo ln -s libssl.so.1.1 libssl.so.1.0.0
sudo ln -s libcrypto.so.1.1 libcrypto.so.1.0.0
}

function WSMan_centos{
cd /lib64
sudo ln -s libssl.so.1.1 libssl.so.1.0.0
sudo ln -s libcrypto.so.1.1 libcrypto.so.1.0.0
}

#fix GSS failure 
function GSS_debian{
sudo apt install gss-ntlmssp -y
}
function GSS_centos{
sudo yum install gssntlmssp -y
}

fix_debian{
GSS_debian
WSMan_debian
}
fix_centos{
GSS_centos
WSMan_centos
}


function menu {
echo "Choose OS"
echo "  1) Debian"
echo "  2) CentOS"
echo "  3) Stop"

read n
case $n in
  1) fix_debian;;
  2) fix_centos;;
  3) exit 1;;
  *) echo "invalid option";;
esac
}

check_if_sudo
menu
#source https://thomask.sdf.org/blog/2019/12/15/linux-windows-powershell-remoting-troubleshooting.html