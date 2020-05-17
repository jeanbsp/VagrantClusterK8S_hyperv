Vagrant.configure("2") do |config|
  config.vm.provider :hyperv do |v|
  config.vm.box = "generic/ubuntu2004"
  config.vm.network "public_network"

  end

  %w{worker1 worker2 worker3}.each_with_index do |name, i|
    config.vm.define name do |worker|
      worker.vm.box = "generic/ubuntu2004"
      worker.vm.hostname = name
      #worker.enable_virtualization_extensions = true
      #worker.linked_clone = true
      worker.vm.provision :shell, path: "install-docker.sh"
      
    end
  end
end
