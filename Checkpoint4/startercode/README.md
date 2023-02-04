# Azure Scripting

### Quick Start with bash

```bash
# login from your command prompt to Azure
# You will not need this if you are working from Azure bash in Portal
az login
```

### Azure Network CLI Commands

| Azure Network Command | Description |
|-|-|
| [az network](<https://learn.microsoft.com/en-us/cli/azure/network?view=azure-cli-latest>) | Manage Azure Network resources |
| [az subnets](https://learn.microsoft.com/en-us/cli/azure/network/vnet/subnet?view=azure-cli-latest) | Manage subnets in an Azure Virtual Network |
| [az peering](https://learn.microsoft.com/en-us/cli/azure/peering?view=azure-cli-latest) | Manage peering |
| [az route table](https://learn.microsoft.com/en-us/cli/azure/network/route-table?view=azure-cli-latest) | Manage route tables |

---

### Working with Azure Network Resources
```bash
# List all virtual networks in a subscription
az network vnet list -g "MyResourceGroup"

# List all virtual networks in a subscription format output to table
az network vnet list -g "MyResourceGroup" --out table

# List all virtual networks in a subscription format output to json
az network vnet list -g "MyResourceGroup" --out json

# List all virtual networks in a subscription format output to table and send to file
az network vnet list -g "MyResourceGroup" --out table > <filename.filetype>

# List all virtual networks in a subscription format output to table and append to file
az network vnet list -g "MyResourceGroup" --out table >> <filename.filetype>

# List virtual networks in a subscription which specify a certain address prefix
az network vnet list --query "[?contains(addressSpace.addressPrefixes, '10.0.xx.xx/16')]"
```

### Working with Azure Subnet Resources
```bash
# List the subnets in a virtual network
az network vnet subnet list -g "MyResourceGroup" --vnet-name "MyVNet"

# Show details of a subnet
az network vnet subnet show -g "MyResourceGroup" -n "MySubnet" --vnet-name "MyVNet"
```

### Working with Azure Peering Resources
```bash
# Lists all of the peerings under the given subscription
az peering peering list --resource-group "MyResourceGroup"

# Gets an existing peering with the specified name under the given subscription and resource group
az peering peering show --peering-name "peeringName" --resource-group "MyResourceGroup"
```

### Working with Azure Route Tables
```bash
# List all route tables in a subscription
az network route-table list -g "MyResourceGroup"

# Get the details of a route table
az network route-table show -g "MyResourceGroup" -n "MyRouteTable"

# List routes in a route table
az network route-table route list -g "MyResourceGroup" --route-table-name "MyRouteTable"

# Get the details of a route in a route table
az network route-table route show -g "MyResourceGroup" --route-table-name "MyRouteTable" -n "MyRoute" -o table
```

### Creating & Configuring Resources with Azure Bash
If you like to learn more advanced Azure bash scripting techniques take a look at the script files:
- Configuration file to define and declare variables: [config.sh](./config.sh). You need to update the variables as per your environment properties.
- Create and configure VNET and Peerings as per checkpoint instructions: [vnet.sh](./vnet.sh). You can use this script to create, update, modify or delete your resources, but you must use proper `parameters` when you want to execute the script. Check the comments or maybe the error message system throws if script is executed with parameters.
- Create and configure Route Tables, Routes, and Subnet associations as per checkpoint instructions: [route_tbl.sh](./route_table.sh). You can use this script to create, update, modify or delete your resources, but you must use proper `parameters` when you want to execute the script. Check the comments or maybe the error message system throws if script is executed with parameters.
- Script to create all resources for this checkpoint: [cp1-scripts.sh](./cp1-scripts.sh). This script shows you how to use the other scripts to `CREATE` resources

These are advanced CLI scripting tools, only for learning purposes, you do not need to use them for his checkpoint if you find them overwhelming.

---

Useful Links:

- [Azure CLI Sample Scripts for working with virtual networks (VNETS)](https://docs.microsoft.com/en-us/azure/virtual-network/cli-samples?toc=%2Fcli%2Fazure%2Ftoc.json&bc=%2Fcli%2Fazure%2Fbreadcrumb%2Ftoc.json&view=azure-cli-latest)
- [Azure CLI / Reference / Azure Network](<https://learn.microsoft.com/en-us/cli/azure/service-page/azure%20network?view=azure-cli-latest>)
- [Azure CLI  Reference / Azure Network / network / az network vnet](<https://learn.microsoft.com/en-us/cli/azure/network/vnet?source=recommendations&view=azure-cli-latest>)
