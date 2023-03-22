**COURSE INFORMATION:  CSN400NCC**\
**STUDENT’S NAME:  AUSTIN MACKENZIE**\
**STUDENT'S NUMBER: 100311216**\
**GITHUB USER ID: 100311216-myseneca**\
**TEACHER’S NAME:  ATOOSA NASIRI**

<br>
<br>
<br>


## ***Table of Contents*** 
* Part A - [Logging Packets with Specific Prefixes](#part-a--logging-packets-with-specific-prefixes)
* Part B - [Filtering Logged Packets](#part-b--filtering-logged-packets)
* Part C - [Analyzing Logged Packets](#part-c---analyzing-logged-packets)
* Part D - [Azure Cost Analysis Charts](#part-d---cost-analysis)

<br>
<br>
<bR>


### **PART A** -Logging Packets with Specific Prefixes: 

<br>

[lr_firewall_log.sh](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/LoggingPackets/lr_firewall_log.sh)

[lr_firewall_log.txt](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/LoggingPackets/lr_firewalls_log.txt )


<br>

```bash
Chain INPUT (policy ACCEPT 23500 packets, 5022K bytes)
 pkts bytes target     prot opt in     out     source               destination
 3730  227K LOG        tcp  --  *      *       10.56.177.4          192.168.89.36        tcp dpt:22 LOG flags 0 level 4 prefix "SSH INPUT LR-89: "
    1    52 ACCEPT     tcp  --  *      *       10.56.177.0/24       192.168.89.36        tcp dpt:22 state NEW

Chain FORWARD (policy ACCEPT 69 packets, 5796 bytes)
 pkts bytes target     prot opt in     out     source               destination
   96 11294 LOG        tcp  --  *      *       10.56.177.4          172.17.89.37         tcp dpt:22 LOG flags 0 level 4 prefix "SSH FORWARD LS-89: "
  101 11554 ACCEPT     tcp  --  *      *       10.56.177.0/24       172.17.89.32/27      tcp dpt:22
 1486  174K LOG        tcp  --  *      *       10.56.177.4          172.17.89.36         tcp dpt:3389 LOG flags 0 level 4 prefix "RDP FORWARD WS-89: "
   80 11278 ACCEPT     tcp  --  *      *       172.17.89.32/27      10.56.177.0/24       tcp spt:22
   52  2151 LOG        tcp  --  *      *       10.56.177.4          172.17.89.36         tcp dpt:53 LOG flags 0 level 4 prefix "DNS TCP FORWARD: "
 1486  174K ACCEPT     tcp  --  *      *       10.56.177.0/24       172.17.89.32/27      tcp dpt:3389
  405 26843 LOG        udp  --  *      *       10.56.177.4          172.17.89.36         udp dpt:53 LOG flags 0 level 4 prefix "DNS UDP FORWARD: "
 2508  412K ACCEPT     tcp  --  *      *       172.17.89.32/27      10.56.177.0/24       tcp spt:3389
   42  1731 ACCEPT     tcp  --  *      *       10.56.177.4          172.17.89.36         tcp dpt:53
   40  1612 ACCEPT     tcp  --  *      *       172.17.89.36         10.56.177.4          tcp spt:53
   11   854 LOG        tcp  --  *      *       10.56.177.4          172.17.89.37         tcp dpt:3306 LOG flags 0 level 4 prefix "MySQL FORWARD LS-89: "
    7   427 ACCEPT     udp  --  *      *       10.56.177.4          172.17.89.36         udp dpt:53
    5   859 ACCEPT     udp  --  *      *       172.17.89.36         10.56.177.4          udp spt:53
   48 10127 LOG        tcp  --  *      *       10.56.177.4          172.17.89.37         tcp dpt:80 LOG flags 0 level 4 prefix "HTTP FORWARD LS-89: "
   37  1791 LOG        tcp  --  *      *       10.56.177.4          172.17.89.36         tcp dpt:21 LOG flags 0 level 4 prefix "FTP CONTROL PLANE FORWARD WS-"
   11   854 ACCEPT     tcp  --  *      *       10.56.177.0/24       172.17.89.37         tcp dpt:3306
   13  3955 LOG        tcp  --  *      *       10.56.177.4          172.17.89.36         tcp dpts:50000:51000 LOG flags 0 level 4 prefix "FTP DATA PLANE FORWARD WS-89:"
   19  1683 LOG        tcp  --  *      *       10.56.177.4          172.17.89.36         tcp dpt:80 LOG flags 0 level 4 prefix "HTTP FORWARD WS-89: "
   10  1474 ACCEPT     tcp  --  *      *       172.17.89.37         10.56.177.0/24       tcp spt:3306
   48 10127 ACCEPT     tcp  --  *      *       10.56.177.0/24       172.17.89.37         tcp dpt:80
   33  4619 ACCEPT     tcp  --  *      *       172.17.89.37         10.56.177.0/24       tcp spt:80
   19  1683 ACCEPT     tcp  --  *      *       10.56.177.0/24       172.17.89.36         tcp dpt:80
   19  2428 ACCEPT     tcp  --  *      *       172.17.89.36         10.56.177.0/24       tcp spt:80
   37  1791 ACCEPT     tcp  --  *      *       10.56.177.0/24       172.17.89.36         tcp dpt:21
   41  2835 ACCEPT     tcp  --  *      *       172.17.89.36         10.56.177.0/24       tcp spt:21
   13  3955 ACCEPT     tcp  --  *      *       10.56.177.0/24       172.17.89.36         tcp dpts:50000:51000
   11   678 ACCEPT     tcp  --  *      *       172.17.89.36         10.56.177.0/24       tcp spts:50000:51000
    3  3780 LOG        all  --  *      *       10.56.177.0/24       172.17.89.36         LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
    3  3780 DROP       all  --  *      *       10.56.177.0/24       172.17.89.36

Chain OUTPUT (policy ACCEPT 16357 packets, 4145K bytes)
 pkts bytes target     prot opt in     out     source               destination
 4253  736K LOG        tcp  --  *      *       192.168.89.36        10.56.177.4          tcp spt:22 LOG flags 0 level 4 prefix "SSH OUTPUT WC-10.56.177.4: "


```
<br>



### **PART B** -Filtering Logged Packets: 
<br>

[logged_packets.log](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/FilteringLoggedPackets/logged_packets.log)

```bash

Mar 21 02:24:42 LR-89 kernel: SSH INPUT LR-89: IN=eth0 OUT= MAC=00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00 SRC=10.56.177.4 DST=192.168.89.36 LEN=40 TOS=0x00 PREC=0x00 TTL=128 ID=24093 DF PROTO=TCP SPT=49768 DPT=22 WINDOW=2047 RES=0x00 ACK URGP=0

Mar 21 01:52:48 LR-89 kernel: SSH OUTPUT WC-10.56.177.4: IN= OUT=eth0 SRC=192.168.89.36 DST=10.56.177.4 LEN=116 TOS=0x08 PREC=0x40 TTL=64 ID=24143 DF PROTO=TCP SPT=22 DPT=49768 WINDOW=405 RES=0x00 ACK PSH URGP=0
/var/log/messages-20230320:

Mar 15 00:05:56 LR-89 kernel: TO_DROP_FORWARDIN=eth0 OUT=eth0 MAC=00:0d:3a:0c:3b:59:c0:d6:82:33:2d:a1:08:00 SRC=10.56.177.4 DST=172.17.89.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=57451 DF PROTO=TCP SPT=51318 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0

Mar 21 01:56:08 LR-89 kernel: HTTP FORWARD LS-89: IN=eth0 OUT=eth0 MAC=00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00 SRC=10.56.177.4 DST=172.17.89.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=2040 DF PROTO=TCP SPT=50400 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0
/var/log/messages:

Mar 21 19:29:44 LR-89 kernel: DNS TCP FORWARD: IN=eth0 OUT=eth0 MAC=00:22:48:b0:61:aa:d4:af:f7:3b:c0:04:08:00 SRC=10.56.177.4 DST=172.17.89.36 LEN=41 TOS=0x00 PREC=0x00 TTL=127 ID=7968 DF PROTO=TCP SPT=50787 DPT=53 WINDOW=2052 RES=0x00 ACK PSH URGP=0

Mar 21 01:56:10 LR-89 kernel: HTTP FORWARD WS-89: IN=eth0 OUT=eth0 MAC=00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00 SRC=10.56.177.4 DST=172.17.89.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=9918 DF PROTO=TCP SPT=50403 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0

Mar 21 01:56:29 LR-89 kernel: MySQL FORWARD LS-89: IN=eth0 OUT=eth0 MAC=00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00 SRC=10.56.177.4 DST=172.17.89.37 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=2044 DF PROTO=TCP SPT=50105 DPT=3306 WINDOW=0 RES=0x00 ACK RST URGP=0

Mar 21 01:55:51 LR-89 kernel: FTP CONTROL PLANE FORWARD WS-IN=eth0 OUT=eth0 MAC=00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00 SRC=10.56.177.4 DST=172.17.89.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=9848 DF PROTO=TCP SPT=50391 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0
```

<br>

### **Part C** - Analyzing Logged Packets
<br>


[Table and Answers](https://github.com/130011216-myseneca/CSN400-Capstone/blob/73cefc631e25f49a6eaac536eff2335bbc0bb021/Checkpoint7/Table/Chart.pdf)

| Packet ID | Date                | Mac Address                                 | Protocol | Source Address | Dest. Address | Source Port | Dest. Port | Packet Length | LOG prefix               | Time To Live |
|-----------|---------------------|---------------------------------------------|----------|----------------|---------------|-------------|------------|---------------|--------------------------|--------------|
| 24093     | 2023-03-21 2:24     | 00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00     | TCP      | 10.56.177.4    | 192.168.89.36 | 49768       | 22         | 40            | SSH INPUT LS-89         | 128          |
| 24143     | 2023-03-21 1:52     |                                             | TCP      | 192.168.89.36  | 10.56.177.4   | 22          | 49768      | 116           | SSH OUTPUT WC-10.56.177.4 | 64           |
| 57451     | 2023-03-15 0:05     | 00:0d:3a:0c:3b:59:c0:d6:82:33:2d:a1:08:00     | TCP      | 10.56.177.4    | 172.17.89.37 | 51318       | 21         | 52            | DNS UDP FORWARD:         | 127          |
| 2040      | 2023-03-21 1:56     | 00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00     | TCP      | 10.56.177.4    | 172.17.89.37 | 50400       | 80         | 52            | HTTP FORWARD WS-89       | 127          |
| 7968      | 2023-03-21 19:29    | 00:22:48:b0:61:aa:d4:af:f7:3b:c0:04:08:00     | UDP      | 10.56.177.4    | 172.17.89.36 | 50787       | 53         | 41            | DNS TCP FORWARD          | 127          |
| 9918      | 2023-03-21 1:56     | 00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00     | TCP      | 10.56.177.4    | 172.17.89.36 | 50403       | 80         | 52            | HTTP FORWARD LS-89       | 127          |
| 2044      | 2023-03-21 1:56     | 00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00     | TCP      | 10.56.177.4    | 172.17.89.37 | 50105       | 3306       | 40            | MySQL FORWARD LS-89      | 127          |
| 9848      | 2023-03-21 1:55     | 00:0d:3a:f3:8e:0e:d4:af:f7:48:3e:e8:08:00	  | TCP	     | 10.56.177.4    | 172.17.89.36 | 50391	   | 21         | 52	        |FTP CONTROL PLANE FORWARD WS-|	127


<br>

### **Part D** - Cost Analysis

![1](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Graphs/1.jpg)

![2](https://github.com/130011216-myseneca/CSN400-Capstone/blob/0b70d944cf011827af14eedc6472432fe383744c/Checkpoint7/Graphs/2.jpg)

![3](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Graphs/3.jpg)

![4](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Graphs/4.jpg)

![5](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Graphs/5.jpg)

![6](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/Graphs/6.jpg)