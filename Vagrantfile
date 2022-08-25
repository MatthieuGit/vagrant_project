# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE_TO_USE = "geerlingguy/ubuntu2004"
CPU_NUMBER = "1"
MEMORY_SIZE = "1024"
ADDRESS_IP_XENA ="10.0.0.10"

Vagrant.configure("2") do |config|  
  config.vm.define "xena" do |xena|
    xena.vm.network "private_network", ip: ADDRESS_IP_XENA
    xena.vm.box = IMAGE_TO_USE
    xena.vm.provider "virtualbox" do |vb|
     vb.cpus = CPU_NUMBER
     vb.memory = MEMORY_SIZE
    end
    xena.vm.provision :shell do |shell|
      shell.path = "install_pet_clinic.sh"
    end
  end
end
