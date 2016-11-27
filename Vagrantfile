# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "scotchbox"
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

    config.vm.provider "virtualbox" do |v|
      v.memory = 512
      # v.cpus = 2
    end

        # Fix for slow external network connections
    config.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
      vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    end

    # Optional NFS. Make sure to remove other synced_folder line too
    #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }

  # Running bootstrap
  # -----------------
  config.vm.provision :shell, :path => "vagrant_bootstrap/bootstrap.sh"

end