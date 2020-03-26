# Vagrant webdriver collection 

Inspired by https://github.com/jonashackt/vagrant-macosx/blob/master/Vagrantfile

## Including VMS of:
* macos mojave with Safari 12 (Must run on macos host!)
* windows 10 with Edge 18
Batteries included to run selenium tests on them!

You may choose which vms you want to create and use. 

Vagrant is a cli tool/framework to automate vms on various providers. on our case: virtualbox!

The macbox is huge! 13GB. and the S3 it's on is very slow. please be patient when you start it on the first time. 

## Prerequisites
* lots of free disk space (20GB+ per vm)
* Be on macos
* Install virtualbox & virtualbox-extension-pack (`brew cask install virtualbox` &&  `brew cask install virtualbox-extension-pack`)
* Install vagrant (`brew cask install vagrant`)

The password for the users is always `vagrant`  
On the guests vms the `/vagrant` path is mapped to the current directory

To ssh the machines: `vagrant ssh 'vmname'`  
To see the ips of the vms: `vagrant ssh-config`

And you can always access the vms ui via virtualbox ui

More vagrant commnads:
* `vagrant up [boxname]`
* `vagrant suspend [boxname]`
* `vagrant halt [boxname]`
* `vagrant destroy [boxname]`