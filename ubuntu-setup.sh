#!/bin/bash

# replace source to ustc mirros
sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

apt-get update
function install_pkg {
    apt-get -y install --no-install-recommends $@
}

dev_pkg_list="libpoco-dev uuid-dev libncurses5-dev python3-dev python3-pip cmake git vim wget pkg-config openssh-server ninja-build netcat gdb gdbserver"
install_pkg $dev_pkg_list
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
python3 -m pip install protobuf==3.14.0


