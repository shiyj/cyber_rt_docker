#!/bin/bash

cyber_version=$1

echo "using cyber rt v${cyber_version}"
cd /opt

function run_v9 {
    python3 install.py
}

function run_old {
    ./scripts/install.sh
}

git clone --single-branch --branch v${cyber_version} https://github.com/minhanghuang/CyberRT.git
cd CyberRT

if [ "${cyber_version}" = "9.0.0" ];then
    run_v9
else
    run_old
fi

source install/setup.bash
mkdir build && cd build
cmake ..
make -j$(nproc)

# setup 
echo 'source /opt/CyberRT/build/setup.bash' >> ~/.bashrc
echo 'source /opt/CyberRT/install/setup.bash' >> ~/.bashrc

echo 'source /opt/CyberRT/build/setup.zsh' >> ~/.zshrc
echo 'source /opt/CyberRT/install/setup.zsh' >> ~/.zshrc

inc_path="export CPLUS_INCLUDE_PATH=/opt/CyberRT/install/include:/opt/CyberRT/:$CPLUS_INCLUDE_PATH"

echo $inc_path >>  ~/.bashrc
echo $inc_path >>  ~/.zshrc

echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config