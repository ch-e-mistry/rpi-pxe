#VARIABLES
BASE_BOX = "debian/contrib-buster64"
BOX_RAM_MB = "1024"
BOX_1 = "rpi-pxe"

Vagrant.configure("2") do |config|
 
  config.vm.define BOX_1 do |ansible|
    ansible.vm.box = BASE_BOX
    ansible.vm.provider "virtualbox" do |vb|
      vb.memory = BOX_RAM_MB
    end
    ansible.vm.network "private_network", ip: "192.168.56.220"
    ansible.vm.synced_folder "./provision", "/provision"
    ansible.vm.synced_folder "./srv", "/srv"
    ansible.vm.provision "shell", path: "provision/install.sh"
#    ansible.vm.provision "shell", inline: "hostnamectl set-hostname ansible"
  end
end