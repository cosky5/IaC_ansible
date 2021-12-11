#1.  Have a common username that has sudo level acces#
#2. Setup passwordless sshkeys
#3. Enable SSH on remote hosts sudo apt-get install openssh-server

# INSTALL & CONFIG

sudo apt update

sudo apt install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update

sudo apt-get install ansible -y


#confirm working by running the ping module against localhost:
ansible localhost -m ping


#### REMOTE HOSTS ####
#create local hostnames in hosts file
sudo nano /etc/hosts


#create entry for 172.16.1.10       hostname
# Create SSH key on ansible server
ssh-keygen
# accepted the defaults
# list the keys to verify
ls .ssh

#cp the key to other machine
ssh-copy-id -i .ssh/id_rsa.pub ubuntu

#note if refused, run:
#sudo apt-get install openssh-server

#Now configure sudo so that it doesn't require a password.
ssh ubuntu
sudo visudo

#Very bottom of file add this line:
devuser ALL=(ALL) NOPASSWD ALL


#### INVENTORY ####
sudo nano /etc/ansible/hosts
#create GUI like so at bottom of file
# [gui]
# ubuntu
# centos

# can also specify username to use ubuntul ansible_user=administrator

ansible -m ping ALL


### Module ###
# Raw module with the uptime action (- a)
ansible -m raw -a '/usr/bin/uptime' linuxhosts

ansible -m shell -a 'python3 -V' linuxhosts

ansible all -a 'whoami'
# elevate to root with -b to become. why is that? Because ansible doesn't elevate to sudo by default
ansible all -b -a 'whoami'

#Note not specifying a module like above it default to command module


### NETWORKING ###
# Set environment variable for auth to device
# cd to the directory
# source .ansible_env
