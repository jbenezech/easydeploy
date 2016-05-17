# -*- mode: ruby -*-
# vi: set ft=ruby :

ansible_verbosity = 'vvvv'
##########################################################################

#Fix for people with strange locale settings
ENV.keys.each {|k| k.start_with?('LC_') && ENV.delete(k)}

def host_box_is_unixy?
  (RUBY_PLATFORM !~ /cygwin|mswin|mingw|bccwin|wince|emx/)
end

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  verbosity_arg = if defined? ansible_verbosity then ansible_verbosity else '' end
#  if host_box_is_unixy?
#    config.vm.synced_folder "./", "/vagrant"
#    config.vm.provision :ansible do |ansible|
#      ansible.playbook = 'provisioning/site.yml'
#      ansible.verbose = verbosity_arg
#      ansible.tags = 'install'
#      ansible.groups = { "proactit" => ["default"] }
#    end
#  end

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 25, host: 25
  config.vm.network "private_network", ip: "192.168.50.4"

end