# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"

  # Network configuration:
  config.vm.network "private_network", ip: "192.168.33.10"

  # Shell provisioning:
  config.vm.provision :shell, path: "bootstrap.sh"
end
