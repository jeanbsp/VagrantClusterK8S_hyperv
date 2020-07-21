Vagrant.configure("2") do |config|
  config.vm.provider :hyperv do |v|
  config.vm.box = "generic/ubuntu2004"
  config.vm.network "public_network"

  end

  config.vm.define "master01" do |master01|
    master01.vm.box = "generic/ubuntu2004"
    master01.vm.provision :shell, path: "install-docker.sh"
    master01.vm.network "forwarded_port", guest: 80, host: 9090
    master01.vm.network "private_network", ip: "192.168.200.30"
    
  end

  %w{worker1 worker2 worker3}.each_with_index do |name, i|
    config.vm.define name do |worker|
      worker.vm.box = "generic/ubuntu2004"
      worker.vm.hostname = name
      worker.vm.network "forwarded_port", guest: 80, host: 9090
      worker.vm.network "private_network", ip: "192.168.200.30"
      #worker.enable_virtualization_extensions = true
      #worker.linked_clone = true
      worker.vm.provision :shell, path: "install-docker.sh"
      
    end
  end
end
