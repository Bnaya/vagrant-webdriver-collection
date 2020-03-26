# See also https://github.com/jonashackt/vagrant-macosx/blob/master/Vagrantfile

Vagrant.configure("2") do |config|
  # config.vm.define "ubuntu" do |ubuntu|
  #   ubuntu.vm.box = "ubuntu/bionic64"
  #   ubuntu.vm.network "forwarded_port", guest: 4444, host: 5444
  # end

  config.vm.define "macossafari12" do |macos|
    macos.vm.box = "yzgyyang/macOS-10.14"
    # macos.vm.network "forwarded_port", guest: 4444, host: 7444
    macos.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4

      # Some needed OSX configs
      v.customize ["modifyvm", :id, "--cpuid-set", "00000001", "000106e5", "00100800", "0098e3fd", "bfebfbff"]
      v.customize ["setextradata", :id, "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct", "MacBookPro11,3"]
      v.customize ["setextradata", :id, "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion", "1.0"]
      v.customize ["setextradata", :id, "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct", "Iloveapple"]
      v.customize ["setextradata", :id, "VBoxInternal/Devices/smc/0/Config/DeviceKey", "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"]
      v.customize ["setextradata", :id, "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC", "1"]

      # set resolution on OSX:
      # 0,1,2,3,4,5 :: 640x480, 800x600, 1024x768, 1280x1024, 1440x900, 1920x1200
      v.customize ["setextradata", :id, "VBoxInternal2/EfiGopMode", "4"]


    # NFS needs host-only network
    macos.vm.network "private_network", ip: "172.16.2.42"

    # macos.vm.synced_folder ".", "/vagrant", disabled: true
    
    # Use NFS for the shared folder
    macos.vm.synced_folder ".", "/vagrant",
      id: "core",
      :nfs => true,
      :mount_options => ['nolock,vers=3,udp,noatime,actimeo=1,resvport'],
      
    :export_options => ['async,insecure,no_subtree_check,no_acl,no_root_squash']
    
    macos.vm.provision "shell", path: "./provisions/macos.sh"
    macos.vm.provision "shell", path: "./provisions/macosAlways.sh", run: 'always'

    end
  end

#   config.vm.provider "virtualbox" do |v|
#     v.gui = true
#   end
end
