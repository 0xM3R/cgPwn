# cgPwn - Cyber Grand Pwnage Box 
 This is a Ubuntu VM tailored for hardware hacking, RE and Wargaming.

## Tools included
*  Pwndbg
*  Pwntools
*  Binwalk
*  Radare2 
*  Capstone, Unicorn and Keystone Engines
*  Qira Timeless Debugger
*  AFL
*  Valgrind , VGdb
*  ROPGadget, XRop, Ropper, rp++
*  Intel PIN
*  Angr
*  z3 
*  frida 
*  Compiler tools: CLANG, LLVM, GDBMultiarch, GDBArm
*  Useful tools: htop, lynx, socat, p7zip, mc 
<p align="center">
![cgPwn Usage DEMO](https://thumbs.gfycat.com/AccomplishedPleasedBlackrhino-size_restricted.gif)
</p>

## Vagrant

### Install VirtualBox
Check [Virtualbox](https://www.virtualbox.org/wiki/Downloads) for information on installing Virtualbox on your respective operating system.

### Install Vagrant
Check [VagrantUp](https://www.vagrantup.com/downloads.html) for information on installing vagrant.

### Fire up the VM
```
git clone https://github.com/0xM3R/cgPwn
cd cgPwn
vagrant up
... Grab a beer and relax until everything is getting setup for you ;)
vagrant ssh
```

## Default settings
By default, [personal dotfiles](http://github.com/0xM3R/dotfiles) are installed onto the VM. Simply comment out the following lines in cgPwn.sh if you don't want my settings.

```
# Personal config
sudo apt-get -y install stow
cd ~
rm .bashrc
git clone https://github.com/0xM3R/dotfiles
cd dotfiles
chmod a+x ./install.sh
./install.sh
```

### Shared folder

Drop files in the `sharedFolder` folder on your host to find them on your VM at `/home/vagrant/sharedFolder`
