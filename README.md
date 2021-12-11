# IaC_ansible
Ansible is the tried and true automation and orchestration of choice when it comes to automating and orchestrating the entire network infrastructure. This the code of NetDevOps and what NetDevOps does and how Ansible works. 

## Configuring Remote Devcie
IP - Address is as follows
```
sudo nano etc/hosts

172.16.1.10     centos
172.16.1.40     ubuntu
```

## Inventory File
The default location for inventory is a file called `/etc/ansible/hosts`. You can specify a different inventory file at the command line using the -i <path> option. 
The inventory file can be in one of many formats, depending on the inventory plugins you have. The most common formats are `INI` and `YAML`. A basic `INI` `/etc/ansible/hosts` might look like this:


## Ansible Module
Module are pre-built python script that comes with `Ansible`. 
```
Raw module with the uptime action (- a)
ansible -m raw -a '/usr/bin/uptime' linuxhosts

ansible -m shell -a 'python3 -V' linuxhosts
```

## Playbook
Command to run first Playbook
```
ansible-playbook stats.yml
```

## Variables and Facts
Ansible uses variables to manage differences between systems. With Ansible, you can execute tasks and playbooks on multiple different systems with a single command. [source](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html)
```
ansible-playbook variables.yml
```

## Facts
Ansible facts are data gathered about target nodes (host nodes to be configured) and returned back to controller nodes. Ansible facts are stored in JSON format and are used to make important decisions about tasks based on their statistics. [source](https://www.redhat.com/sysadmin/playing-ansible-facts)
```

  ansible ubuntu -m setup
  ansible ubuntu -m setup -a "filter=ansible_os_family"
  ansible ubuntu -m setup -a filter=ansible_user_id"
```