#!/bin/bash
# Author : 0xM3R
# Purpose : Cyber Grand Pwnage Box
#################################
HOMEDIR=~

# Updates
sudo apt-get -y update

sudo apt-get -y install python3-pip
sudo apt-get -y install tmux
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install gcc-multilib
sudo apt-get -y install clang llvm
sudo apt-get -y install unzip
sudo apt-get -y install foremost
sudo apt-get -y install ipython
sudo apt-get -y install silversearcher-ag

# Install 32 bit libs
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt-get -y install libc6-dev-i386
sudo apt-get -y install libc6-dbg # necessary for pwndbg's heap functionality 
sudo apt-get -y install libc6-dbg:i386 #necessary for pwndbg's heap functionality 
sudo apt-get -y install valgrind #useful when using vgdb ;)
sudo apt-get -y install gcc-arm-linux-gnueabihf # for the arm toolchain 
# Enable ptracing
sudo sed -i 's/kernel.yama.ptrace_scope = 1/kernel.yama.ptrace_scope = 0/g' /etc/sysctl.d/10-ptrace.conf
sudo sysctl --system

# Fix urllib3 InsecurePlatformWarning
sudo -H pip install --upgrade urllib3[secure]

# Fix warning when loading .gdbinit files
echo 'set auto-load safe-path /' > ~/.gdbinit

 #Install PwnTools
sudo apt-get -y install python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential
sudo -H pip install --upgrade pip
sudo -H pip install --upgrade git+https://github.com/Gallopsled/pwntools

#install some useful system tools
sudo apt-get -y install htop
sudo apt-get -y install lynx
sudo apt-get -y install socat
sudo apt-get -y install p7zip
sudo apt-get -y install mc

cd ~
mkdir tools
cd tools


# pycparser for pwndbg
sudo -H pip3 install pycparser # Use pip3 for Python3

# Install pwndbg latest version 
cd ~/tools 
git clone --recursive https://github.com/pwndbg/pwndbg
cd pwndbg 
sudo ./setup.sh 

# Install radare2
cd ~/tools
git clone https://github.com/radare/radare2
cd radare2
./sys/install.sh

# Install binwalk
cd ~/tools
git clone https://github.com/devttys0/binwalk
cd binwalk
sudo python setup.py install
sudo apt-get -y install squashfs-tools

# Install Keystone engine with debug option
cd ~/tools
sudo apt-get -y install cmake
git clone https://github.com/keystone-engine/keystone.git
cd keystone
mkdir build
cd build
../make-share.sh debug
sudo make install
cd ../bindings/python/
sudo python setup.py install
sudo ldconfig

#install qira timeless debugger
cd ~/tools 
wget -q https://github.com/BinaryAnalysisPlatform/qira/archive/v1.2.tar.gz
tar zxvf v1.2.tar.gz 
rm v1.2.tar.gz 
cd qira-1.2 
./install.sh

#install xrop
cd ~/tools
git clone --depth 1 https://github.com/acama/xrop.git
cd xrop
git submodule update --init --recursive
sudo make install


# Install american-fuzzy-lop
cd ~/tools
wget --quiet http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz
tar -xzvf afl-latest.tgz
rm afl-latest.tgz
wget --quiet http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
xz -d clang*
tar xvf clang*
cd clang*
cd bin
export PATH=$PWD:$PATH
cd ../..
(
  cd afl-*
  make
  # build clang-fast
  (
    cd llvm_mode
    make
  )
  sudo make install

  # build qemu-support
  sudo apt-get -y install libtool automake bison libglib2.0-dev
  ./build_qemu_support.sh
)


# Install r2pipe
sudo -H pip install --upgrade r2pipe

# Install frida
sudo -H pip install --upgrade frida

# Install ROPGadget
cd ~/tools
git clone https://github.com/JonathanSalwan/ROPgadget
cd ROPgadget
sudo python setup.py install

# Install intel PIN
cd ~/tools
wget  --quiet http://software.intel.com/sites/landingpage/pintool/downloads/pin-2.14-71313-gcc.4.4.7-linux.tar.gz
tar -xzvf pin-2.14-71313-gcc.4.4.7-linux.tar.gz
rm pin-2.14-71313-gcc.4.4.7-linux.tar.gz
cd pin*
export PIN_ROOT=$PWD
export PATH=$PATH:$PIN_ROOT;

#Install angr 
sudo -H pip install angr 

#Install ropper 
sudo -H pip install ropper 

#install golang
sudo apt-get -y install golang 

# Personal config
sudo apt-get -y install stow
cd ~
rm .bashrc
git clone --recursive https://github.com/0xM3R/dotfiles
cd dotfiles
chmod a+x ./install.sh
./install.sh

#install rp++
cd ~/tools
wget -q https://github.com/downloads/0vercl0k/rp/rp-lin-x64
    sudo install -s rp-lin-x64 /usr/bin/rp++
rm rp-lin-x64

# Fix locales after installing everything
sudo locale-gen en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo dpkg-reconfigure locales
