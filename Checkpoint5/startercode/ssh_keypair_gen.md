# Connect to your VMs with ssh
- [How to create and use an SSH public-private key pair **with Windows** for Azure Linux VMs](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows)
- [How to create and use an SSH public-private key pair **with Linux** for Azure Linux VMs](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys)

## Supported SSH key formats
Azure currently supports SSH protocol 2 (SSH-2) RSA public-private key pairs with a minimum length of 2048 bits. **Other key formats such as ED25519 and ECDSA are not supported.**

Create an SSH key pair in ` powershell `
```powershell
ssh-keygen -m PEM -t rsa -b 2048
```

Create an SSH key pair in ` bash `
```bash
ssh-keygen -m PEM -t rsa -b 4096
```

Provide an SSH public key when deploying a VM
```bash
cat ~/.ssh/id_rsa.pub
````

Connect to your VM using your key in ` ~/.ssh/id_rsa `
```bash
ssh -i ~/.ssh/id_rsa azureuser@10.111.12.123
```
