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
sudo apt -y install virtualbox-guest-additions-iso
sudo apt -y install open-vm-tools-desktop
sudo apt -y install git
sudo apt -y install python3 python3-pip python3-dev
sudo apt -y install libfuse2
sudo apt -y install libssl
sudo apt -y install nodered
sudo apt -y install nmap
sudo snap install snap-store
sudo snap install firefox

echo "I am G$(whoami)."
    
su vagrant -c "pip3 install python-snap7"
su vagrant -c "pip3 install pymodbus"
su vagrant -c "pip3 install notebook"
    
echo "I am G$(whoami)!"
    
reboot