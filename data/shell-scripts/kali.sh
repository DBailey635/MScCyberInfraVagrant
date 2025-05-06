# This shell script installs the default specialist softare for the MSc Cyber Security course into Kali VMs. 

# Make user vagrant an administrator:
sudo usermod -aG sudo vagrant

# Create the vagrant user home directory:
sudo mkhomedir_helper vagrant

# Fix broken public key
echo "### Fix broken public key (if required)"
sudo wget https://archive.kali.org/archive-keyring.gpg \ -O /usr/share/keyrings/kali-archive-keyring.gpg

# Update and install missing software:
echo "### Updater"
sudo apt -y update

echo "### Install GIT"
sudo apt -y install git

echo "### Install Python 3"
sudo apt -y install python3

echo "### Install Python 3 PIP"
sudo apt -y install python3-pip

echo "### Install Python 3 Developer"
sudo apt -y install python3-dev
    
echo "### Install Python Modules"
su vagrant -c "pip3 install pymodbus"
su vagrant -c "pip3 install python-snap7"
su vagrant -c "pip3 install pylogix"
    
echo "### Clone GIT Repositories"

cd /home/vagrant
mkdir ICS
    
cd ICS
mkdir Assets
mkdir Exploit_kits
mkdir Tools
mkdir Python3_lib
    
cd Assets
git clone https://github.com/digitalbond/Redpoint
git clone https://github.com/moki-ics/modscan
git clone https://github.com/moki-ics/plcscan
    
cd ../Exploit_kits
mkdir ISEF
mkdir IEF
git clone https://github.com/w3h/isf ISEF
git clone https://github.com/dark-lbp/isf IEF

cd ../Tools
git clone https://github.com/tijldeneut/icssecurityscripts
git clone https://github.com/keyvdir/pyiec61850

cd ../Python3_lib
git clone https://github.com/mz-automation/libiec61850
# cd libiec61850
# su vagrant -c "make examples"
# su vagrant -c "make install"

echo "### All Done!"
echo "### I am G$(whoami)! Reboot"

reboot