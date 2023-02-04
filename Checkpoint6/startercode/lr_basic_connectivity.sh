# Flush All Iptables Chains/Firewall rules
echo "-------------------------------------------"
echo "Flush All Iptables Chains/Firewall rules"
iptables -F

# Delete all Iptables Chains
echo "-------------------------------------------"
echo "Delete all Iptables Chains"
iptables -X

# Allow any INPUT tcp traffic if RELATED or ESTABLISHED
echo "-------------------------------------------"
echo "Allow any INPUT tcp traffic if RELATED or ESTABLISHED"
iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

# Allow icmp traffic into the VM
echo "-------------------------------------------"
echo "Allow icmp traffic into the VM"
iptables -A INPUT -p icmp -j ACCEPT

# Allow any traffic from loopback interface into the VM
echo "-------------------------------------------"
echo "Allow any traffic from loopback interface into the VM"
iptables -A INPUT -i lo -j ACCEPT

# Allow all SSH traffic on port 22 from Source IP subnet student_vnet
echo "-------------------------------------------"
echo "Allow all SSH traffic on port 22 from Source IP subnet student_vnet"
iptables -A INPUT -p tcp -s xx.xx.xx.xx/24 -m state --state NEW --dport 22 -j ACCEPT

# Log instead of DROPPING
echo "-------------------------------------------"
echo "Add a rule to LOG instead of DROPPING INPUT packets"
iptables -A INPUT -p all -m limit --limit 10/s -j LOG  --log-prefix "TO_DROP_INPUT"

# Reject all other INPUT traffic
# echo "-------------------------------------------"
# echo "Reject all other INPUT traffic"
# iptables -A INPUT -j DROP

# Allow forwarding all SSH traffic on port 22 from any source to any destination
echo "-------------------------------------------"
echo "SSH"
echo "Allow forwarding all SSH traffic on port 22 from any source to any destination"
iptables -A FORWARD -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -p tcp --sport 22 -j ACCEPT

# Allow forwarding all RDP traffic on port 3389 from any source to any destination
echo "-------------------------------------------"
echo "RDP"
echo "Allow forwarding all RDP traffic on port 3389 from any source to any destination"
iptables -A FORWARD -p tcp --dport 3389 -j ACCEPT
iptables -A FORWARD -p tcp --sport 3389 -j ACCEPT

# Allow forwarding all SQL traffic on port 3306  from any source to any destination
echo "-------------------------------------------"
echo "SQL"
echo "Allow forwarding all SQL traffic on port 3306  from any source to any destination"
iptables -A FORWARD -p tcp --dport 3306  -j ACCEPT
iptables -A FORWARD -p tcp --sport 3306  -j ACCEPT

# Allow forwarding all HTTP traffic on port 80 from any source to any destination
echo "-------------------------------------------"
echo "HTTP"
echo "Allow forwarding all HTTP traffic on port 80 from any source to any destination"
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --sport 80 -j ACCEPT

# Log instead of DROPPING
echo "-------------------------------------------"
echo "Add a rule to LOG instead of DROPPING FORWARD packets"
iptables -A FORWARD -p all -m limit --limit 10/s -j LOG --log-prefix "TO_DROP_FORWARD"

# Reject all other FORWARD traffic from this machine
# echo "-------------------------------------------"
# echo "Reject all other FORWARD traffic from this machine"
# iptables -A FORWARD -j DROP

# Allow all output traffic from this machine
echo "-------------------------------------------"
echo "Allow all output traffic from this machine"
iptables -A OUTPUT -j ACCEPT

# List current iptables status
echo "-------------------------------------------"
echo "list current iptables status"
iptables -nvL --line-number
