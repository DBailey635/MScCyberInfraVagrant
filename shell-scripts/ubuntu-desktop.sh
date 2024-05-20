# This shell script installs the default specialist softare for the MSc Cyber Security course into Ubuntu Core VMs. 

# Make user vagrant an administrator:
sudo usermod -aG sudo vagrant

# Create the vagrant user home directory:
sudo mkhomedir_helper vagrant

# Update and install missing software:
echo "### Updater"
sudo apt -y update

echo "### Install Ubuntu Desktop Minimal"
sudo apt -y install ubuntu-desktop-minimal

echo "### Install Support for Virtual Machines"
sudo apt -y install virtualbox-guest-additions-iso
sudo apt -y install open-vm-tools-desktop

echo "### Install GIT"
sudo apt -y install git

echo "### Install Python 3"
sudo apt -y install python3

echo "### Install Python 3 PIP"
sudo apt -y install python3-pip

echo "### Install Python 3 Developer"
sudo apt -y install python3-dev

echo "### Install Libfuse2"
sudo apt -y install libfuse2

echo "### Install SSL"
sudo apt -y install libssl

echo "### Install NodeRed"
sudo apt -y install nodejs
sudo apt -y install npm
sudo npm install -g --unsafe-perm node-red

echo "### Install NMAP"
sudo apt -y install nmap

echo "### Install Snaps"
sudo snap install snap-store
sudo snap install firefox

echo "### Install Python Modules"
su vagrant -c "pip3 install python-snap7"
su vagrant -c "pip3 install pymodbus"
su vagrant -c "pip3 install notebook"
    
echo "### All Done!"
echo "### I am G$(whoami)!"
    
reboot