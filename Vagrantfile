# specify os constants
module OS
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def OS.mac?
        (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def OS.unix?
        !OS.windows?
    end

    def OS.linux?
        OS.unix? and not OS.mac?
    end
end

# get data folder name
if OS.windows?
  dataFolderName = "lpsk"
else
  dataFolderName = ".lpsk"
end    

# get data folder path
dataFolderPath = ENV['LPSK_DATA_FOLDER'] || File.join(ENV['HOME'], dataFolderName)

# create data folder if not exists
Dir.mkdir(dataFolderPath) unless File.exists?(dataFolderPath)

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
  config.vm.synced_folder dataFolderPath, "/lpsk"

  # set hostname
  config.vm.hostname = "lan"

  # use bridge networking
  config.vm.network "public_network", type: "dhcp"

  # copy files to vm
  config.vm.provision "file", source: "lpsk/init/lpsk", destination: "/tmp/lpsk"
  config.vm.provision "file", source: "lpsk/index.html", destination: "/tmp/index.html"
  config.vm.provision "file", source: "lpsk/docker-compose.yml", destination: "/tmp/docker-compose.yml"  
  config.vm.provision "file", source: "lpsk/vhosts.conf", destination: "/tmp/vhosts.conf"  
  config.vm.provision "file", source: "lets-chat/settings.yml", destination: "/tmp/settings.yml"

  # execute shell scripts in vm
  config.vm.provision "shell", path: "bootstrap/inputrc.sh", privileged: true
  config.vm.provision "shell", path: "bootstrap/bashrc.sh", privileged: false
  config.vm.provision "shell", path: "bootstrap/docker.sh", privileged: false
  config.vm.provision "shell", path: "bootstrap/lpsk.sh", privileged: false  

end
