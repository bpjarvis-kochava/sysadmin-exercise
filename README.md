Install Ansible
```
sudo apt-get install python-virtualenv virtualenvwrapper python-pip
mkvirtualenv ansible-tuto
workon ansible-tuto
pip install ansible==2.7.1
```
- Run the playbook to install apache on the other node
  - Edit hosts and put in the IP of node B
  - Run: `ansible-playbook -i hosts apache.yml`
