# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  # Network configuration:
  config.vm.network "private_network", ip: "192.168.33.10"

  # Shell provisioning:
  config.vm.provision :file, source: "bootstrap.sh", destination: "/vagrant/bootstrap.sh"
  config.vm.provision :shell, privileged: false, inline: "/vagrant/bootstrap.sh"
end
