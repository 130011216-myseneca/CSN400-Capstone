**COURSE INFORMATION:  CSN400NCC**\
**STUDENT’S NAME:  AUSTIN MACKENZIE**\
**STUDENT'S NUMBER: 100311216**\
**GITHUB USER ID: 100311216-myseneca**\
**TEACHER’S NAME:  ATOOSA NASIRI**

<br>
<br>
<br>


## ***Table of Contents*** 
* Part A - [Route Table Updates](#part-a--logging-and-analyzing-dns-and-http-traffic)
* Part B - [Port Forwarding Basic Connectivity](#part-b--logging-and-analyzing-ftp-and-mysql-traffic)
* Part C - [Logging and Isolating Masqueraded Packets](#part-c---adjusting-firewalls-to-drop-and-log-traffic)
* Part D - [Azure Cost Analysis Charts](#part-d---cost-analysis)

<br>
<br>
<bR>


### **PART A** -Route Table Updates: 

<br>

![**Route Tables**](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/iptableslin.jpg?raw=true)

![](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/iptableslin2.jpg?raw=true)
![**Route Tables**](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/RT-89.jpg?raw=true)
![**Route Tables**](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/Rex.jpg?raw=true)


<br>


<br>



### **PART B** -Port Forwarding Basic Connectivity: 
<br>


```bash
iptables -t nat -F

# to log outgoing traffic
iptables -t nat -A POSTROUTING -j LOG --log-prefix "Outgoing traffic "
#POSTROUTING
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

#PREROUTING
# to log incoming traffic to APACHE server
iptables -t nat -A PREROUTING -p tcp --dport 1889 -j LOG --log-prefix "APACHE "
# to allow other students to access APACHE server
iptables -t nat -A PREROUTING -p tcp --dport 1889 -j DNAT --to-destination 172.17.89.37:80

# to log incoming traffic to MySQL server
iptables -t nat -A PREROUTING -p tcp --dport 1689 -j LOG --log-prefix "MySQL "
# to allow other students to access MySQL server
iptables -t nat -A PREROUTING -p tcp --dport 1689 -j DNAT --to-destination 172.17.89.37:33$
# to log incoming traffic to Linux server - SSH
iptables -t nat -A PREROUTING -p tcp --dport 1289 -j LOG --log-prefix "SSH "
# to allow other students to access Linux server - SSH
iptables -t nat -A PREROUTING -p tcp --dport 1289 -j DNAT --to-destination 172.17.89.37:22

# to log incoming traffic to IIS server
iptables -t nat -A PREROUTING -p tcp --dport 1989 -j LOG --log-prefix "IIS "
# to allow other students to access IIS server
iptables -t nat -A PREROUTING -p tcp --dport 1989 -j DNAT --to-destination 172.17.89.36:80

# to log incoming traffic to Windows server - RDP
iptables -t nat -A PREROUTING -p tcp --dport 1389 -j LOG --log-prefix "RDP "
# to allow other students to access Windows server - RDP
iptables -t nat -A PREROUTING -p tcp --dport 1389 -j DNAT --to-destination 172.17.89.36:33$

```


<br>

### **PART C** - Logging and Isolating Masqueraded Packets
<br>

```bash

Apr 11 22:12:03 LR-89 kernel: log-captures masquerading httIN=eth0 OUT=eth0 MAC=00:22:48:b1:08:cd:c0:d6:82:30:eb:9c:08:00 SRC=192.168.90.36 DST=172.17.89.36 LEN=52 TOS=0x00 PREC=0x00 TTL=125 ID=5087 DF PROTO=TCP SPT=54773 DPT=80 WINDOW=2050 RES=0x00 ACK URGP=0 
Apr 11 22:21:34 LR-89 kernel: log-captures masquerading httIN=eth0 OUT=eth0 MAC=00:22:48:b1:08:cd:c0:d6:82:30:eb:9c:08:00 SRC=192.168.90.36 DST=172.17.89.37 LEN=40 TOS=0x00 PREC=0x00 TTL=125 ID=5281 DF PROTO=TCP SPT=54871 DPT=80 WINDOW=2050 RES=0x00 ACK URGP=0
Apr 11 22:22:37 LR-89 kernel: log-captures masquerading mysIN=eth0 OUT=eth0 MAC=00:22:48:b1:08:cd:c0:d6:82:30:eb:9c:08:00 SRC=192.168.90.36 DST=172.17.89.37 LEN=40 TOS=0x00 PREC=0x00 TTL=125 ID=5289 DF PROTO=TCP SPT=52053 DPT=3389 WINDOW=29200 RES=0x00 SYN URGP=0=0x00 TTL=125 ID=5286 DF PROTO=TCP SPT=54891 DPT=3306 WINDOW=2049 RES=0x00 ACK URGP=0
Apr 11 22:20:31 LR-89 kernel: log-captures masquerading rdpIN=eth0 OUT=eth0 MAC=00:22:48:b1:08:cd:c0:d6:82:30:eb:9c:08:00 SRC=192.168.90.36 DST=172.17.89.36 LEN=40 TOS=0x00 PREC=0x00 TTL=125 ID=5157 DF PROTO=TCP SPT=54867 DPT=3389 WINDOW=0 RES=0x00 ACK RST URGP=0
Apr 11 22:20:47 LR-89 kernel: log-captures masquerading httIN=eth0 OUT=eth0 MAC=00:22:48:b1:08:cd:c0:d6:82:30:eb:9c:08:00 SRC=192.168.90.36 DST=172.17.89.37 LEN=40 TOS=0x00 PREC=0x00 TTL=125 ID=5167 DF PROTO=TCP SPT=54870 DPT=80 WINDOW=2049 RES=0x00 ACK FIN URGP=0
```

![logged_packets.log](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/masqueraded-capture.jpg?raw=true)

<br>


### **PART D** - Cost Analysis

![1](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/Cost1.jpg?raw=true)
![2](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/Cost2.jpg?raw=true)
![3](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/Cost3.jpg?raw=true)
![4](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/Cost4.jpg?raw=true)
![5](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/Cost5.jpg?raw=true)
![6](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint9/Cost6.jpg?raw=true)