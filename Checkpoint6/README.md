# Checkpoint6 Instructions & Submission Requirements

_This page only contains assignment instructions and submission requirements. Make sure to check Seneca Learning Portal: Blackboard for due dates_.

## Objectives

In this Checkpoint will accomplish the following objectives:

- Establish basic connectivity between all machines
- Install and configure various services for testing in Linux Router Machine
- Install software required to host and test services and to monitor network traffic in Windows Client
- Get all your machines connected to your Windows Client

## Part A - DevTest Lab VM Configuration

```markdown
_Remember to replace ‘XX’ with your Unique ID_

# Windows 10 Client :  WC-XX
Base Image:  Windows 10 Pro 21H1

Install the following applications:  
- Notepad++, Filezilla FTP client, MySQL shell (MySQL client)

# Linux Router :  LR-XX
Base Image:  Red Hat Linux Enterprise 8.0

Perform the following configuration tasks:
- Install SSH keys to access the machine for administration
- Remove the firewalld service
- Install iptables-services (remember to enable and restart the service)
- Change the hostname to LR-XX.csn500XX.com
- Enable IPv4 Forwarding
- Install tcpdump
- Run a Yum Update
**Ensure that all configurations are persistent (they don’t go away after you restart the VM.)**

# Windows Server :  WS-XX
Base Image:  Windows 2019 Datacenter

Optional - Perform the following configuration tasks:
- Install Wireshark, Firefox

# Linux Server : LS-XX
Base Image:  Red Hat Linux Enterprise 8.0

Perform the following configuration tasks:
- Install SSH keys to access the machine for administration
- Remove the firewalld service
- Install iptables-services (remember to enable and restart the service)
- Change the hostname to LS-XX.csn500XX.com
- Install tcpdump
- Run a Yum Update
**Ensure that all configurations are persistent (they don’t go away after you restart the VM.)**
```

## Part B - Linux VMs Firewall Setting

1. Configure firewall setting in your Linux Router `LR-xx`. You can use the suggested firewall settings in [lr_basic_connectivity.sh](./startercode/lr-basic_connectivity.sh) for this purpose. Update the file as per your default student vnet address pace and your unique ID. Copy and paste the updated file into your linux router machine and `chmod +x`and run it with `sudo ./lr_basic_connectivity.sh`
2. Make sure all your firewall settings are modified by running `sudo lr_iptables -nvL > iptables.txt`. You will need to submit the output of this command in a `.txt` file format in GitHub under the folder for this assignment.
3. **Ensure that all configurations are persistent (they don’t go away after you restart the VM.)**
4. Configure firewall setting in your Linux Server `LS-xx`. You can use the suggested firewall settings in [ls_basic_connectivity.sh](./startercode/ls-basic_connectivity.sh) for this purpose. Update the file as per your default student vnet address pace and your unique ID. Copy and paste the updated file into your linux server machine and `chmod +x`and run it with `sudo ./ls_basic_connectivity.sh`
5. Make sure all your firewall settings are modified by running `sudo iptables -nvL > ls_iptables.txt`. You will need to submit the output of this command in a `.txt` file format in GitHub under the folder for this assignment.
6. **Ensure that all configurations are persistent (they don’t go away after you restart the VM.)**

## Part C - Enable ip-forwarding for your router Network Interface Card (NIC)

Follow below instructions if you are using Azure Portal:

1. You can only do this after your Linux Router VM is created and its status changes to `running`
2. Look for your NIC in all your cloud resources, find `lr-xx` and go to ip configuration settings, and set `ip-forwarding` dial to **Enable**

Follow below instructions if you are using Azure CLI:

1. You can only do this after your Linux Router VM is created and its status changes to `running`
2. Check [./startercode/nic_IP_config.sh](./startercode/nic_IP_cofig.sh). You can run the script or copy and paste the commands to command prompt one at a time

Each time you re- create your `RX-xx` VM, you need to enable ip-forwarding for its **NIC** (Network Interface Card), otherwise irrespective of your firewall settings neither `rdp` nor `ssh` to your servers will not work from CLient VM `WC-xx``. 

Always check the status of ip-forwarding in `router-xx` using command `az network nic ip-config show`. You ill need to add necessary parameters for this command to work. Refer to [Useful Links](#useful-links) for link to command usage documentation.

Which property shows the status of ip-forwarding attribute? Embed the output in `json` format in your `README.md` and highlight the property that shows status of ip-forwarding.

## Part D - Basic Connectivity between Desktop Clients & Servers

Test your firewall settings and your configurations for basic `ssh` and `rdp` connectivity between your Desktop CLient and Linux Server `LS-xx` and Windows Server `WS-xx`. As proof that you have established successful basic connectivity between your Desktop Client and both Servers, you will need to submit the changes in your packet counts using `sudo iptables -nvL` command in  your Linux Router.


## GitHub Submission Instructions

In your "CSN400-Capstone" repository make a directory `Checkpoint6`. In this directory create a file `README.me`. **Do not to copy / paste content from Instruction in your `README.md`**. This work must be your authentic genuine work. You may use other resources as reference, but `README.md` that will be considered for your marking must be your genuine authentic work.

```markdown
Add below lines to `README.md` and update with your details

# Checkpoint6 Submission

- **COURSE INFORMATION: xxx**
- **STUDENT’S NAME: xxx**
- **STUDENT'S NUMBER: xxx**
- **GITHUB USER ID: xxx**
- **TEACHER’S NAME: xxx**

Add a table of contents sections with headers showing your specific headers 
### Table of Contents

1. [Part A - DevTest Lab VM Configuration](#header1)
2. [Part B - Linux VMs Firewall Setting](#header2)
3. [Part C - Enable ip-forwarding in NIC](#header4)
4. [Part D - Basic Connectivity](#header3)

You must then add below content into your `README.md`:

1. Part A - DevTest Lab VM Configuration: You do not need to submit anything for this part of the assignment
2. Part B - Linux VMs Firewall Setting: You will need to submit `lr_iptables.txt` and `ls_iptables.txt` files under the folder for this assignment. Nothing need to be added to `README.md`
3. Part C - Enable ip-forwarding in NIC: Which property shows the status of ip-forwarding attribute? Embed the output in `json` format in your `README.md` and highlight the property that shows status of ip-forwarding.
4. Part D - Basic Connectivity: Run a couple of rounds of `ssh` and `rdp` connections. Run `sudo iptables -nvL` and embed the output in your submission 
5. You will need to re-create Custom Images after you have made the configurations in Part A, B, C, D and successfully established basic connectivity. Make sure to create new set of Custom Images from all your VMs even though only Linux machines are updated. You can do this through the DevTest Lab environment in portal or using `./lab_vm_images.sh` script with `CREATE` and `version number` parameters. Run a command in CLI that lists all your Custom Images in your DevTest Lab environment. Hint: `az lab custom-image list ...`
6. Delete your VMs after your work is completed. Run a command in CLI that lists all your VMs in your DEvTEst Lab environment. Hint: `az lab vm list ...`
```

**Take note:**

- You are not allowed to work from remote though browser or from local. You must use local repo in your laptop and azure.You can use any IDE of your choice, though the preferred option in this course is Microsoft VS Code.
- Build the habit of continuous, gradual and small updates with multiple `add` , `commit` , `push`. If a single commit has large volume of text and code added to your repository, it will raise the question of the source of the work. This exercise must have at least 6 commits.

## Blackboard Submission Instructions

You need to submit two files in Blackboard:

1. Your `README.md` file
2. A single pdf file with title `CP6-student number.pdf`. If your file is not `.pdf` I will not mark it

In your 'pdf' file include below information:

1. A link to your GitHub repository root folder
2. A link to your `Checkpoint6` folder that contains your `README.md` and other files
3. A screenshot of your `Checkpoint6/README.md` commit history
4. Details of your last commit number to `Checkpoint6/README.md`
5. Log record of your last commit from local repository using `git log -n 1` command


**Take note:**

- Your report file format and naming must follow above instruction, **no marks** will be given to submissions that do not follow the above instructions.
- Do not copy anything from the course notes or references in your submission. What you submit must be your authentic work, even if it is brief. A zero mark will be given to works that are copied from other people's work, and you will be reported to academic misconduct committee for further actions.
- [Seneca’s Copyright Policy](#seneca’s-copyright-policy) applies to all the content you create and all the material provided to you throughout the course.

---

### Useful Links

- [az network nic ip-config documentation](https://learn.microsoft.com/en-us/cli/azure/network/nic/ip-config?view=azure-cli-latest)

---

### Seneca’s Copyright Policy

> Most of the materials posted in this course are protected by copyright. It is a violation of Canada's Copyright Act and [Seneca's Copyright Policy](https://www.senecacollege.ca/about/policies/copyright-policy.html) to share, post, and/or upload course material in part or in whole without the permission of the copyright owner. This includes posting materials to third-party file-sharing sites such as assignment-sharing or homework help sites. Course material includes teaching material, assignment questions, tests, and presentations created by faculty, other members of the Seneca community, or other copyright owners.

> It is also prohibited to reproduce or post to a third-party commercial website work that is either your own work or the work of someone else, including (but not limited to) assignments, tests, exams, group work projects, etc. This explicit or implied intent to help others may constitute a violation of [Seneca’s Academic Integrity Policy](https://www.senecacollege.ca/about/policies/academic-integrity-policy.html) and potentially involve such violations as cheating, plagiarism, contract cheating, etc.  

> These prohibitions remain in effect both during a student’s enrollment at the college as well as withdrawal or graduation from Seneca.
