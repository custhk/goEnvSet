#!/bin/bash
if [ $GOROOT ];then
	cd $GOPATH/src/golang.org/x/
	if [ -d "net/" ];then
		echo -e "\033[33m--------------net exits--------------\033[0m"	
	else
		echo -e "\033[33m--------------net doesn't exit--------------\033[0m"
		echo -e "\033[34m--------------download net--------------\033[0m"
		git clone https://github.com/golang/net.git
	fi
	cd net
	rm -fr http2
	echo -e "\033[34m--------------download push client support http2 lib--------------\033[0m"
	git clone https://github.com/custhk/http2.git
	cd $GOPATH/src/
	echo -e "\033[34m--------------download myself http2 server and client--------------\033[0m"
	git clone https://github.com/custhk/goHttp2Server http2
else
	echo -e "\033[31m--------------go env error, if you have set, you should reboot--------------\033[0m"
fi

