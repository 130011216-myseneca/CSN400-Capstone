# Variable Declaration with `config.sh`

It is a good coding practice to declare all the variables that would be used in your scripts in a file. Declarations follow linux variable declaration syntax. For simplicity, they are all declared in single `config.sh` file. You will need to update it as per yor specific configuration, address spaces, and unique ID assigned to you.

```bash
# Variable block

# Remember to replace xx with your unique ID
# Remember to replace xxxxxx with the default  resource group assigned to you in CloudLab
# Remember to replace X with your subscription ID

# Basic Resource Variable Declaration
Location="Canada East"
RG_Name="Student-RG-xxxxxx"
Sub_ID="X"
Student_vnet="Student-xxxxxx-vnet"
Router_vnet="Router-xx"
Server_vnet="Server-xx"
SubNet="SN1"
RT_Name="RT-xx"
Client_SN="Virtual-Desktop-Client"
Virtual_Appliance="192.168.xx.36"
Server_SN1="172.17.xx.32/27"
Virtual_Desktop="10.xx.xx.0/24" # student-vnet address space
DevTest_Lab="CSN400-xx"

Peer_RT="RoutertoStudent"
Peer_TR="StudenttoRouter"
Peer_RS="RoutertoServer"
Peer_SR="ServertoRouter"

Route_Server="Route-Server"
Route_Client="Route-Desktop"

# VM names Declaration
VM_WC="WC-xx"
VM_WS="WS-xx"
VM_LR="LR-xx"
VM_LS="LS-xx"
```

### Usage

To include variable declaration in your script `/.sh` files, you can `source` them in the beginning of the script

```bash
source ./config.sh
```


---

### USeful Links

- [Unix / Linux - Using Shell Variables](https://www.tutorialspoint.com/unix/unix-using-variables.htm)
