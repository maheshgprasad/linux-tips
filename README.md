# linux-tips

# Get IP Address information on your Linux Virtual Machine Terminal
1. as sudo open the file /etc/issue using vi / nano / vim editor
2. now append the line \4 {your_ethernet_interface_name} | for example: \4{enp0s3} 
3. Save and Quit
4. You are done. 
You now get to see the ip address of your Virtual Machine each time you turn it on.
![Login Screen on VM](https://github.com/maheshgprasad/linux-tips/blob/master/Azrael_1.PNG)
