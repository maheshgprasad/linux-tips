# Jenkins Application Link
https://www.jenkins.io/doc/book/installing/linux/

# Jenkins Installation for Redhat,Rocky,Alma Linux.
```
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
```
# Add required dependencies for the jenkins package
```
sudo yum install java-11-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins
```
If you encounter issues with Jenkins being exposed only for tcp6.
Run the following command. 
```
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload
```
