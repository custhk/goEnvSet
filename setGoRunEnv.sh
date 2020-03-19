#!/bin/bash
goTar="go1.14.linux-amd64.tar.gz"
goRoot=/opt/go
goPath=/opt/gopath
# get go tar
cd /opt
if [ -f "/opt/${goTar}" ];then
echo -e "\033[33m--------------${goTar} exits--------------\033[0m"
else
wget https://dl.google.com/go//${goTar}
fi

# unzip tar
if [ -d "/opt/go/" ];then
echo -e "\033[33m--------------/opt/go/ exits--------------\033[0m"
else
tar -zxvf ${goTar} -C /opt
fi

# set env
mkdir -p /opt/gopath
if [ $GOROOT ];then
echo "GOROOT = $GOROOT"
echo "GOPATH = $GOPATH"
else
cat << EOF >> /etc/profile
export GOROOT=${goRoot}
export GOPATH=${goPath}
export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin
EOF
source /etc/profile
echo -e "\033[32m--------------set GOROOT = $GOROOT--------------\033[0m"
echo -e "\033[32m--------------set GOPATH = $GOPATH--------------\033[0m"
echo -e "\033[33m--------------you need to reboot after git clone--------------\033[0m"
fi

# git clone file from github
if [ $GOROOT ];then
apt-get install git
mkdir -p $GOPATH/src/golang.org/x/
cd $GOPATH/src/golang.org/x/
echo -e "\033[34m--------------download tools--------------"
git clone https://github.com/golang/tools.git
echo -e "\033[34m--------------download net--------------"
git clone https://github.com/golang/net.git
echo -e "\033[34m--------------download crypto--------------"
git clone https://github.com/golang/crypto.git
echo -e "\033[34m--------------download sys--------------"
git clone https://github.com/golang/sys.git
echo -e "\033[34m--------------download text--------------"
git clone https://github.com/golang/text.git
echo -e "\033[34m--------------download lint--------------"
git clone https://github.com/golang/lint.git
else
echo -e "\033[31m--------------go env error, if you have set, you should reboot--------------\033[0m"
fi


