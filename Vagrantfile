# See also https://github.com/jonashackt/vagrant-macosx/blob/master/Vagrantfile

Vagrant.configure("2") do |config|
  # config.vm.define "ubuntu" do |ubuntu|
  #   ubuntu.vm.box = "ubuntu/bionic64"
  #   ubuntu.vm.network "forwarded_port", guest: 4444, host: 5444
  # end

  config.vm.define "win10" do |win10|
    win10.vm.box = "gusztavvargadr/windows-10"
    win10.vm.box_version = "1909.0.2003-enterprise"

    win10.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 4

      v.customize ["modifyvm", :id, "--vram", "128"]
    end

    win10.vm.network "forwarded_port", guest: 4444, host: 6444




    # Enable auto login for powershell_elevated_interactive to work!
    # https://gist.github.com/StefanScherer/adbb421dc0adca75b49e0031a99595a5
    win10.vm.provision "shell", privileged: false, inline: <<-SHELL
      Set-ItemProperty "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon" -Name AutoAdminLogon -Value 1
      Set-ItemProperty "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon" -Name DefaultUserName -Value "vagrant"
      Set-ItemProperty "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon" -Name DefaultPassword -Value "vagrant"
      Remove-ItemProperty "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon" -Name AutoAdminLogonCount -Confirm -ErrorAction SilentlyContinue
    SHELL

    win10.vm.provision "shell", path: "./provisions/windows10.ps1", reboot: true

    win10.vm.provision "shell", path: "./provisions/windows10Always.ps1", powershell_elevated_interactive: true, run: 'always'
  end

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
    end

    # NFS needs host-only network
    macos.vm.network "private_network", ip: "172.16.2.42"

    # macos.vm.network :hostonly, "192.168.50.5"

    macos.vm.network "forwarded_port", guest: 4444, host: 5444
    # config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"

    # macos.vm.synced_folder ".", "/vagrant", disabled: true

    # Use NFS for the shared folder
    macos.vm.synced_folder ".", "/vagrant",
      id: "core",
      :nfs => true,
      :mount_options => ['nolock,vers=3,udp,noatime,actimeo=1,resvport'],

    :export_options => ['async,insecure,no_subtree_check,no_acl,no_root_squash']


    macos.vm.provision "shell", path: "./provisions/macos.sh", privileged: false
    macos.vm.provision "shell", path: "./provisions/macosAlways.sh", privileged: false, run: 'always'
  end

#   config.vm.provider "virtualbox" do |v|
#     v.gui = true
#   end
end