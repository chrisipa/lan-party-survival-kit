VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.define :lpsk do |lpsk|
    lpsk.vm.hostname = "lan"
    lpsk.vm.network "public_network", type: "dhcp"
    lpsk.vm.provision "file", source: "lpsk", destination: "~/lpsk"
    lpsk.vm.provision "file", source: "settings.yml", destination: "~/settings.yml"
    lpsk.vm.provision "file", source: "docker-compose.yml", destination: "~/docker-compose.yml"
    lpsk.vm.provision :shell, :path => "bootstrap.sh", :privileged => false
  end

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.name = "Lan Party Survival Kit"
    v.memory = 1024
    v.cpus = 1
  end
end
