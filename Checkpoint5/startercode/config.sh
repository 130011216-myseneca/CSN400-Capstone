
# Variable block

# Basic Resource Variable Declaration
Location="Canada East"
RG_Name="Student-RG-????"
Sub_ID="?????"
Student_vnet="Student-??????-vnet"
Router_vnet="Router-???"
Server_vnet="Server-???"
SubNet="SN1"
RT_Name="RT-???"
Client_SN="Virtual-Desktop-Client"
Virtual_Appliance="192.168.???.36"
Server_SN1="172.17.???.32/27"
Virtual_Desktop="10.???.???.0/24" # student-vnet address space
DevTest_Lab="CSN400-???"

Peer_RT="RoutertoStudent"
Peer_TR="StudenttoRouter"
Peer_RS="RoutertoServer"
Peer_SR="ServertoRouter"

Route_Server="Route-Server"
Route_Client="Route-Desktop"

# VM names Declaration
VM_WC="WC-???"
VM_WS="WS-???"
VM_LR="LR-???"
VM_LS="LS-???"

# Advanced Configuration Array Declaration
# This is not needed for CP1 or CP2
declare -a vm_list=("$VM_WS" "$VM_WC" "$VM_LR" "$VM_LS")
declare -a json_list=("ws.json" "wc.json" "lr.json" "ls.json")
declare -a image_list=("$VM_WS" "$VM_WC" "$VM_LR" "$VM_LS")
declare -a windowslist=("$VM_WS" "$VM_WC")
declare -a linux_list=("$VM_LR" "$VM_LS")
declare -a vnet_list=("$Server_vnet" "$Router_vnet" "$Student_vnet")
declare -a v_list=("$Server_vnet" "$Router_vnet")
declare -a nic_list=("$NIC_LR" "$NIC_LS" "$NIC_WS" "$NIC_WC")
declare -a peer_list=("$Peer_RT" "$Peer_TR" "$Peer_RS" "$Peer_SR")
declare -a route_list=("$Route_Server" "$Route_Client")
declare -a subnets_rvnet=("192.168.???.32/27" "192.168.???.64/27" "192.168.???.96/27" "192.168.???.128/27")
declare -a subnets_svnet=("172.17.???.32/27" "172.17.???.64/27" "172.17.???.96/27" "172.17.???.128/27")