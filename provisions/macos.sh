set -x
echo "Running provisioning script";
id;
df -h;
time brew update;
brew install node@12;
echo 'export PATH="/usr/local/opt/node@12/bin:$PATH"' >> ~/.bash_profile
export PATH="/usr/local/opt/node@12/bin:$PATH";

brew install htop

sudo safaridriver --enable;
defaults write com.apple.Safari IncludeDevelopMenu 1;

brew cask install java;

brew cask install firefox;
brew cask install google-chrome;

npm install -g webdriver-manager && webdriver-manager update;

brew tap xfreebird/utils
brew install kcpassword
enable_autologin "vagrant" "vagrant"

echo "Done provisioning script";
