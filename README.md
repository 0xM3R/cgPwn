# cgPwn - Cyber Grand Pwnage Box  - This is a ubuntu VM tailored for hardware hacking, RE and Wargaming.

## Tools included
*  Pwndbg
*  Binwalk
*  Radare2 
*  Capstone, Unicorn and Keystone Engine
*  Qira Timeless Debugger
*  AFL
*  ROPGadget, XRop
*  Intel PIN
*  Angr
*  rp++


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
By default, [personal dotfiles](http://github.com/0xM3R/dotfiles) are installed onto the VM. Simply comment out the following lines in ecgPwn.sh if you don't want my settings.

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
