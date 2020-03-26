echo "Running provisioning script";
id;
df -h;
brew update;
brew install node@12;
npm install -g webdriver-manager;
webdriver-manager update;
sudo safaridriver --enable;
defaults write com.apple.Safari IncludeDevelopMenu 1

brew cask install firefox;
brew cask install google-chrome;

echo "Done provisioning script";