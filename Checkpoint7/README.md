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

```bash
curl -sS "https://raw.githubusercontent.com/130011216-myseneca/CSN400-Capstone/main/Checkpoint7/LoggingPackets/lr_firewalls_log.txt" > lr_firewalls_log.txt && cat lr_firewalls_log.txt
```

[lr_firewall_log.sh](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/LoggingPackets/lr_firewall_log.sh)

```bash
curl -s "https://raw.githubusercontent.com/130011216-myseneca/CSN400-Capstone/main/Checkpoint7/LoggingPackets/lr_firewalls_log.txt"
```
<br>



### **PART B** -Filtering Logged Packets: 
<br>

[logged_packets.log](https://github.com/130011216-myseneca/CSN400-Capstone/blob/main/Checkpoint7/FilteringLoggedPackets/logged_packets.log)
```bash
cat Checkpoint7/FilteringLoggedPackets/logged_packets.log
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
