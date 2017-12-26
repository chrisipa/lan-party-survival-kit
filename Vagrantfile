# set environment variables for lpsk folders
LPSK_SHARE_FOLDER = ENV['LPSK_SHARE_FOLDER'] || 'C:\\Share'
LPSK_EXCHANGE_FOLDER = ENV['LPSK_EXCHANGE_FOLDER'] || 'C:\\Exchange'

Vagrant.configure("2") do |config|

  # set virtual machine image
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # set provider
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.name = "Lan Party Survival Kit"
    v.memory = 1024
    v.cpus = 1
  end  

  # specify synced folders with host
  config.vm.synced_folder LPSK_SHARE_FOLDER, "/share"
  config.vm.synced_folder LPSK_EXCHANGE_FOLDER, "/exchange"  

  # set hostname
  config.vm.hostname = "lan"

  # use bridge networking
  config.vm.network "public_network", type: "dhcp"

  # copy files to vm
  config.vm.provision "file", source: "lpsk/init/lpsk", destination: "/tmp/lpsk"
  config.vm.provision "file", source: "lets-chat/settings.yml", destination: "/tmp/settings.yml"
  config.vm.provision "file", source: "lpsk/docker-compose.yml", destination: "/tmp/docker-compose.yml"

  # execute shell scripts in vm
  config.vm.provision "shell", path: "bootstrap/inputrc.sh", privileged: true
  config.vm.provision "shell", path: "bootstrap/bashrc.sh", privileged: false
  config.vm.provision "shell", path: "bootstrap/docker.sh", privileged: false
  config.vm.provision "shell", path: "bootstrap/lpsk.sh", privileged: false  

end
