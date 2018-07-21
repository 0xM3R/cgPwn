# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.provision :shell, :path => "cgPwn.sh", :privileged => false
  config.ssh.username = 'vagrant'
  config.vm.hostname = 'pwnBox'
  config.vm.network :private_network, ip: "192.168.13.37"
  config.ssh.forward_agent = true

  config.vm.synced_folder "/home/lowkey/Downloads", "/home/vagrant/sharedFolder"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "3120"]
    vb.customize ["modifyvm", :id, "--cpus", 2]
  end
end
