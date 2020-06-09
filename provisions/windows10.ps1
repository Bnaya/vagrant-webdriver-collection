echo %PATH%;
choco install nodejs-lts -y --no-progress;
refreshenv;
echo %PATH%;
C:/"Program Files"/nodejs/node.exe --version;
echo "---";
choco install googlechrome -y --no-progress;
echo "---";
choco install firefox -y --no-progress;
echo "---";
choco install javaruntime -y --no-progress;
echo "---";

# https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/#downloads
DISM.exe /Online /Add-Capability /CapabilityName:Microsoft.WebDriver~~~~0.0.1.0

echo "---";
refreshenv;
echo %PATH%;
echo "---";
C:/"Program Files"/nodejs/npm.cmd install -g webdriver-manager;
refreshenv;

# disable firewall
netsh advfirewall set allprofiles state off;

# set powershell as openssh default shell
# https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_server_configuration#configuring-the-default-shell-for-openssh-in-windows
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
