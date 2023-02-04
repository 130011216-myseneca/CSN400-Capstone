# Variable block

# Basic Resource Variable Declaration

# CSN400 Default Resources Variable Declaration

# set location to where student resource group is configured
Location=$(az group list --query "[1].location" --output tsv)
echo "$Location"

# set resource group to default student resource group
RG_Name=$(az group list --query "[1].name" --output tsv)
echo "$RG_Name"

# set CloudLad ID to the last 6 digits in Student Resource Group 
CloudLab_ID=${RG_Name:(-6)}
echo "$CloudLab_ID"

# set subscription ID to the current account ID
Sub_ID=$(az account list --query "[].id" --output tsv)
echo "$Sub_ID"

# set student VNET to the default student VNET
Student_vnet="Student-$CloudLab_ID-vnet"
echo "$Student_vnet"

# set Vistual Desktop address space to default address space in Student VNET
Virtual_Desktop=$(az network vnet list --query "[?name=='Student-846349-vnet'].addressSpace.addressPrefixes" --output tsv)
echo "$Virtual_Desktop"

# set Client_SN to the default subnet in default (and only) student VNET 
Client_SN=$(az network vnet subnet list -g Student-RG-846349 --vnet-name Student-846349-vnet --query "[].name" --output tsv)
echo "$Client_SN"

# CSN400 User Created Resource Variable Declaration
XXID="99"
Router_vnet="Router-$XXID"
Server_vnet="Server-$XXID"
SubNet="SN1"
RT_Name="RT-$XXID"
Virtual_Appliance="192.168.$XXID.36"
Server_SN1="172.17.$XXID.32/27"
Router_SN1="192.168.$XXID.32/27"
DevTest_Lab="CSN400-$XXID"

Peer_RT="RoutertoStudent"
Peer_TR="StudenttoRouter"
Peer_RS="RoutertoServer"
Peer_SR="ServertoRouter"

Route_Server="Route-Server"
Route_Client="Route-Desktop"

#Checkpoint2 VM names
VM_WC="WC-$XXID"
VM_WS="WS-$XXID"
VM_LR="LR-$XXID"
VM_LS="LS-$XXID"

#Checkpoint3 Static IP setting
Static_LR="192.168.$XXID.36"
Static_WS="172.17.$XXID.36"
Static_LS="172.17.$XXID.37"
dummy_IP_1="172.17.$XXID.41"
dummy_IP_2="172.17.$XXID.42"
NIC_LR="lr-$XXID"
NIC_LS="ls-$XXID"
NIC_WS="ws-$XXID"
NIC_WC="wc-$XXID"
Azure_Default_DNS="168.63.129.16"

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
declare -a subnets_rvnet=("192.168.$XXID.32/27" "192.168.$XXID.64/27" "192.168.$XXID.96/27" "192.168.$XXID.128/27")
declare -a subnets_svnet=("172.17.$XXID.32/27" "172.17.$XXID.64/27" "172.17.$XXID.96/27" "172.17.$XXID.128/27")
