**COURSE INFORMATION:  CSN400NCC**\
**STUDENT’S NAME:  AUSTIN MACKENZIE**\
**STUDENT'S NUMBER: 100311216**\
**GITHUB USER ID: 100311216-myseneca**\
**TEACHER’S NAME:  ATOOSA NASIRI**

<br>
<br>
<br>


## ***Table of Contents*** 
* Part A - [Logging and Analyzing DNS and HTTP Traffic](#part-a--logging-and-analyzing-dns-and-http-traffic)
* Part B - [Logging and Analyzing FTP and MySQL Traffic](#part-b--logging-and-analyzing-ftp-and-mysql-traffic)
* Part C - [Adjusting Firewalls to DROP and LOG Traffic](#part-c---adjusting-firewalls-to-drop-and-log-traffic)
* Part D - [Azure Cost Analysis Charts](#part-d---cost-analysis)

<br>
<br>
<bR>


### **PART A** -Logging and Analyzing DNS and HTTP Traffic: 

<br>

![**apache-iis-filtered.pcap**](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/PartA.png?raw=true)



<br>


<br>



### **PART B** -Logging and Analyzing FTP and MySQL Traffic: 
<br>

![logged_packets.log](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/PartB.jpg?raw=true)



<br>

### **PART C** - Adjusting Firewalls to DROP and LOG Traffic
<br>


```bash
Apr  4 03:06:06 LR-89 kernel: SSH FORWARD LS-89 DROP: IN=eth0 OUT=eth0 MAC=60:45:bd:5b:74:be:fc:bd:67:ad:c7:9f:08:00 SRC=10.56.177.4 DST=172.17.89.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=43688 DF PROTO=TCP SPT=61318 DPT=22 WINDOW=64240 RES=0x00 SYN URGP=0

Apr  4 03:06:27 LR-89 kernel: FTP CONTROL PLANE BLOCKED WS-IN=eth0 OUT=eth0 MAC=60:45:bd:5b:74:be:fc:bd:67:ad:c7:9f:08:00 SRC=10.56.177.4 DST=172.17.89.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=49356 DF PROTO=TCP SPT=61320 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0
```


![logged_packets.log](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/PartC.jpg?raw=true)


![logged_packets.log](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/dropfilter.jpg?raw=true)



<br>


### **PART D** - Cost Analysis

![1](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Cost1.jpg?raw=true)

![2](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Cost2.jpg?raw=true)

![3](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Cost3.jpg?raw=true)

![4](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Pie1.jpg?raw=true)

![5](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Pie2.jpg?raw=true)

![6](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint8/Images/Pie3.jpg?raw=true)