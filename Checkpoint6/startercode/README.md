# Configuration & Debugging Cheat-sheet

## Windows Client Installation (WC-xx)

Install the following applications using a web browser:

- MySQL Client Shell
- Wireshark
- FileZilla FTP Client

Check the IP configuration
```
ipconfig /all
```

## Linux Server Installation (LS-xx)

```bash
# Remove the firewalld service
sudo firewall-cmd --state
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo systemctl mask --now firewalld
sudo systemctl status firewalld

# Install iptables services
sudo yum install iptables-services
sudo systemctl enable iptables
sudo systemctl iptables

# Work with hostname
sudo hostnamectl status
sudo hostnamectl set-hostname LS-xx.CSN400xx.com #static

# Install tcpdump
sudo yum install tcpdump

# Run yum update
sudo yum update
```

## Linux Router Installation (LR-xx)

```bash
# Remove the firewalld service
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo yum remove firewalld

# Install iptables services
sudo yum install iptables-services
sudo systemctl enable iptables
sudo systemctl iptables

# Work with hostname
sudo hostnamectl status
sudo hostnamectl set-hostname LR-xx.csn400xx.com ##static

# Enable IPv4 forwarding
sudo echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
cat /proc/sys/net/ipv4/ip_forward

# Install tcpdump
sudo yum install tcpdump

# Run yum update
sudo yum update
```
## SSH to Linux VMs

Check [ssh_keypair.gen.md](../../Checkpoint5/startercode/ssh_keypair_gen.md) for more details about how to generate and use SSH keypairs fo Azure VMs.

```powershell
# Connect to VM with a specific key in windows
ssh -i <key-path/private-key-name> azureuser@xxx.xxx.xxx.xxx
```

```bash
# Connect to VM with a specific key in linux
ssh -i <key-path/private-key-name> azureuser@xxx.xxx.xxx.xxx
```

## Working with Linux Firewalls

Check Firewall Settings
```bash
sudo iptables -nvL --line-numbers
```
Syntax to Insert rule, which would be above the existing
```bash
sudo iptables -I <CHAIN> <rule-number> firewall-rule
```
View all `iptables` rules
```bash
sudo iptables -t filter -L <CHAIN> --line-numbers -n -v
```
Insert a rule at a specific rule with line number
```bash
suo iptables -I <CHAIN> <rule-number> -p <protocol> -m <state> --dport <port no> -j <ACTION>
```
Drop chain FORWARD with line number
```bash
sudo iptables -D FORWARD <rule-number>
```
Capture traffic to log file
```bash
sudo iptables -I FORWARD -p all -m limit --limit 10/s -j LOG  --log-prefix "DROPPING..."

# Where to find the logs from `LOG` chain
cat /var/log/messages
```

## Make sure Firewall settings will persist

```bash
# Problem would be that after restarting VM, changes will no persist
# You must save your iptables
sudo iptables-save > /etc/sysconfig/iptables

# Restart iptables to make sure configuration is saved
sudo systemctl restart iptables

# Check rules to make sure changes are saved
sudo iptables -nvL

# If above fails ----- which will :-)))))))

# Use tee with sudo user permission to save changes
sudo iptables-save | sudo tee /etc/sysconfig/iptables

# Restart iptables to make sure configuration is saved
sudo systemctl restart iptables

# Check rules to make sure changes are saved
sudo iptables -nvL
```

## Check if IP Forwarding is enabled in Linux Router

You can query the sysctl kernel value `net.ipv4.ip_forward` to see if forwarding is enabled or not.

Check if IP Forwarding is enabled using `sysctl`
```bash
sudo sysctl net.ipv4.ip_forward
# if not enabled:
net.ipv4.ip_forward = 0
# if enabled:
net.ipv4.ip_forward = 1
```
Or check if IP Forwarding is enabled by checking the value in the `/proc` system
```bash
sudo cat /proc/sys/net/ipv4/ip_forward
# 0 if not enabled
# 1 if enabled
```
## Enable IP Forwarding on the fly
```bash
sudo sysctl -w net.ipv4.ip_forward=1
# Or
sudo echo 1 > /proc/sys/net/ipv4/ip_forward
# Or if you get permission denied
sudo echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
```

## Permanently Enable IP Forwarding
To make this configuration permanent, the best way is using file `/etc/sysctl.conf`
```bash
sudo nano /etc/sysctl.conf
```
Add `net.ipv4.ip_forward = 1` line and save it.
```bash
net.ipv4.ip_forward = 1
```
Enable the changes made in `sysctl.conf`
```bash
sudo sysctl -p /etc/sysctl.conf
# Or
sudo systemctl restart NetworkManager
```

## Check if the IP forwarding in NIC is enabled using Azure bash
```bash
# check if nic forwarding is enabled ...
az network nic show -g MyResourceGroup -n MyNic --query "enableIpForwarding"
```

## Working with `tcpdump` utility

```bash
# Look for Server Traffic in Router VM
sudo tcpdump -i any -qnns 0 host 172.17.xxx.37
```

### Useful Links

- [Working with IPTables](https://wiki.centos.org/HowTos/Network/IPTables)
- [How to use SSH keys with Windows on Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows)
