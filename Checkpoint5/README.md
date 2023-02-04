# Checkpoint5 Instructions & Submission Requirements

_This page only contains assignment instructions and submission requirements. Make sure to check Seneca Learning Portal: Blackboard for due dates_.

## Objectives

In this Checkpoint will accomplish the following objectives:

- Create and configure a DevTest Lab to work in for the semester and isolate our environment
- Create four (4) virtual machines for use with our project
- Create Custom Image form Running VMs
- Use Custom Image to create Custom Deployment `.json` templates
- Use `.json` templates and Custom Images to re-create your VMs

## Part A - Creating Resources in Azure Portal
### DevTest Lab Creation
 
 ```bash
# Devtest Lab Configurations and Policies
# Remember to replace ‘XX’ with your Unique ID
Lab Name:  CSN400-XX

# Turn Public Environments OFF
# Enable the Auto Shutdown and leave it set for 7PM.  We will discuss in class
# Leave the email notification set to NO

Virtual Network:  Student-??????
Subnet:  The first one available 

# Leave Isolate Lab resources set to NO
# Leave the Tags settings at their defaults
```

### DevTest Lab Policy & Configuration

```bash
# Allowed Virtual Machine Sizes:  B2s
# Virtual Machines per User:  4
# Limit the number of virtual machines using premium OS disks:  0

# Add VNETs and enable subnets SN1 for VM creation without public IP
Virtual Networks:  Student-??????, Router-XX, Server-XX

# _Make sure the first subnet of each vnet (look at the network ID, not the name) is configured to allow virtual machine creation, and does not allow public or shared IP addresses_

# Configure Lab Settings:
Resource Group allocation for virtual machines: All virtual machines in one resource group

# Do not change any other settings

# Allow only the following Marketplace Images:
Windows 10 Pro 21H2
Red Hat Enterprise Linux 8.1 (LVM))
Windows Server 2019 Datacenter
```

### VM creation in the DTL

```bash
# Remember to replace ‘XX’ with your Unique ID

# Windows 10 Client
VM name:  WC-XX
Base Image:  Windows 10 Pro 21H1
VNET: Student-?????? vnet

# Linux Router
VM Name:  LR-XX
Base Image:  Red Hat Linux Enterprise 8.0
VNET: Router-XX vnet

# Linux Server
VM Name:  LS-XX
Base Image:  Red Hat Linux Enterprise 8.0
VNET: Server-XX vnet

# Windows Server
VM Name:  WS-XX
Base Image:  Windows 2019 Datacenter
VNET: Server-XX vnet
```

## Part B - Working with `az lab` CLI command

Familiarize yourself with Command Line Interface for DevTest Lab. Some basic commands that can come handy are listed in here:

```bash
# Remember to replace ‘XX’ with your Unique ID

# Get the details of the DevTest Lab
az lab get --lab-name "CSN400-XX" --resource-group "MyResourceGroup"

# You can change output to table or jason format
az lab get --lab-name "CSN400-XX" --resource-group "MyResourceGroup" # -output table

# List custom images in a given lab
az lab custom-image list --lab-name "CSN400-XX" --resource-group "MyResourceGroup"

# List virtual networks in a given lab
az lab vnet list --lab-name "CSN400-XX" --resource-group "MyResourceGroup"

# List the VMs in an Azure DevTest Lab
az lab vm list --lab-name "CSN400-XX" --resource-group "MyResourceGroup"
```

It is recommended that you complete below steps from you Azure Portal CLI Interface, but in order to do this, you need to clone and sync-up your repo in Azure Portal CLI Interface. Complete below steps in the same order as pr below. Make sure you are working in your `Checkpoint5` folder as all files must be in your `Checkpoint5` folder:

1. Get the details of the `CSN400-xx` lab and send the output in `json` format to `devtest_lab.json`
2. Get the list of custom images in `CSN400-xx` lab and send the output in `table` format to `custom_images.tbl`
3. Get the list of vnets in `CSN400-xx` lab and send the output in `table` format to `lab_vnets.tbl`
4. Get the list of VMs in `CSN400-xx` lab and send the output in `table` format to `lab_vm.tbl`

## Part C - Creating VMs using Azure Resource Manager (ARM) & Custom Images 

1. Create Custom Images form Running VMs. Do this step in DevTest Lab environment from your portal
2. To create **Custom Deployment** `.json` templates use Create VM in DevTest Lab environment and under `Advanced Settings` click on `View ARM Template` and inspect the content. Create files and copy the content into properly named `json` files:
        - For Linux Router to lr.json
        - For Linux Server to ls.json
        - For Windows Server to ws.json
        - For Windows client to wc.json
3. Delete each VM one at a time through the DevTest Lab environment in portal. If you are confident that your Custom Images are properly configured you can delete all VMs using `./lab_vm.sh` script with `DELETE` parameter
4. Use `.json` templates and Custom Images to re-create your VMs through the DevTest Lab environment in portal or using `./lab_vm.sh` script and `CREATE` parameter
5. Repeat steps 2 for VMs that are created from Custom Images. Which property in the `.json` templates refers to the custom-image name? Make sure you are able to manually update this field as you update the image version number.

## Part D - Azure Cost Analysis Charts

You can find your cost analysis report **Cost Management** in your `student Resource Group`. In order to make sur you have better understanding about how your resources, services, and products are using your allocated budget, you need to regularly check _cost analysis_ Dashboard. As part of your Checkpoint Submission, you need to submit below graphs:
| No. | Scope | Chart Type | VIEW Type |  Date Range | Group By | Granularity| Example |
|-|-|-|-|-|-|-|-|
|1|Student-RG-xxxxxx| Column (Stacked) | DailyCosts | Last 7 Days | Resource | Daily | [./images/daily-cost-barchart](./images/daily-cost-barchart.jpg)
|2|Student-RG-xxxxxx| Column (Stacked) | DailyCosts | Last 7 Days | Service | Daily | [./images/daily-cost-service-barchart](./images/daily-cost-service-barchart.jpg)
|3|Student-RG-xxxxxx| Area| AccumulatedCosts | Last 7 Days | Resource | Accumulated | [./images/accumulated-resource-barchart](./images/accumulated-resource-barchart.jpg)
|4|Student-RG-xxxxxx| Pie Chart | NA | Last Month | Service Name | NA | [./images/service-name-piechart](./images/service-name-piechart.jpg)
|5|Student-RG-xxxxxx| Pie Chart | NA | Last Month | Service Family | NA | [./images/service-family-piechart](./images/service-family-piechart.jpg)
|6|Student-RG-xxxxxx| Pie Chart | NA | Last Month | Product | NA | [./images/product-piechart](./images/product-piechart.jpg)


## GitHub Submission Instructions

In your "CSN400-Capstone" repository make a directory `Checkpoint5`. In this directory create a file `README.me`. **Do not to copy / paste content from Instruction in your `README.md`**. This work must be your authentic genuine work. You may use other resources as reference, but `README.md` that will be considered for your marking must be your genuine authentic work.

```markdown
Add below lines to `README.md` and update with your details

# Checkpoint5 Submission

- **COURSE INFORMATION: xxx**
- **STUDENT’S NAME: xxx**
- **STUDENT'S NUMBER: xxx**
- **GITHUB USER ID: xxx**
- **TEACHER’S NAME: xxx**

Add a table of contents sections with headers showing your specific headers 
### Table of Contents

1. [Part A - Creating Resources in Azure Portal](#header1)
2. [Part B - Working with `az lab` CLI command](#header2)
3. [Part C - Creating VMs using Azure Resource Manager (ARM) & Custom Images](#header3)
4. [Part D - Azure Cost Analysis Charts](#header4)

You must then add below content into your `README.md`:

1. Part A - Creating Resources in Azure Portal: Take Screenshots of DevTest, DevTestLab Configuration & Policies & Virtual Machines Details. Screenshots should clearly show your Resource Group Name. Add your screenshots in your `README.md` as a proof for completion of Part A - Creating Resources in Azure Portal
2. Part B - Working with `az lab` CLI command: Links to all files you created in this part. Isolate `name` property in `devtest_lab.json` and embed it directly in your `README.md` as a sub-section of a `json` object. You just need to include the key-value pair. 
3. Part C - Creating VMs using Azure Resource Manager (ARM) & Custom Images: Run a command in CLI that lists all your Custom Images in your DevTest Lab environment. You may refer to instructions in [Part B](#part-b---working-with-az-lab-cli-command) for the command and its usage examples.
4. Part D - Submit the cost analysis screenshots as per instructions in your README.md. MAke sure images are not blur and clearly show your `Student-RG-xxxxxx`. Also make sure each image has a caption to indicate what it captures. 


```

**Take note:**

- You are not allowed to work from remote though browser or from local. You must use local repo in your laptop and azure.You can use any IDE of your choice, though the preferred option in this course is Microsoft VS Code.
- Build the habit of continuous, gradual and small updates with multiple `add` , `commit` , `push`. If a single commit has large volume of text and code added to your repository, it will raise the question of the source of the work. This exercise must have at least 6 commits.

## Blackboard Submission Instructions

You need to submit two files in Blackboard:

1. Your `README.md` file
2. A single pdf file with title `CP5-student number.pdf`. If your file is not `.pdf` I will not mark it

In your 'pdf' file include below information:

1. A link to your GitHub repository root folder
2. A link to your `Checkpoint5` folder that contains your `README.md` and other files
3. A screenshot of your `Checkpoint5/README.md` commit history
4. Details of your last commit number to `Checkpoint5/README.md`
5. Log record of your last commit from local repository using `git log -n 1` command
6. Embed your images from Part C for Cost Analysis into your `.pdf` file

**Take note:**

- Your report file format and naming must follow above instruction, **no marks** will be given to submissions that do not follow the above instructions.
- Do not copy anything from the course notes or references in your submission. What you submit must be your authentic work, even if it is brief. A zero mark will be given to works that are copied from other people's work, and you will be reported to academic misconduct committee for further actions.
- [Seneca’s Copyright Policy](#seneca’s-copyright-policy) applies to all the content you create and all the material provided to you throughout the course.

---

### Useful Links

- [Manage Azure DevTest Labs with CLI](https://learn.microsoft.com/en-us/cli/azure/lab?view=azure-cli-latest)
- [Azure CLI / Reference / Azure DevTest Labs / az lab vm](https://learn.microsoft.com/en-us/cli/azure/lab/vm?view=azure-cli-latest)
- [How to use SSH keys with Windows on Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows)
- [What are ARM templates?](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/overview)
- [Quickstart: Create and deploy ARM templates by using the Azure portal](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-the-portal)

---

### Seneca’s Copyright Policy

> Most of the materials posted in this course are protected by copyright. It is a violation of Canada's Copyright Act and [Seneca's Copyright Policy](https://www.senecacollege.ca/about/policies/copyright-policy.html) to share, post, and/or upload course material in part or in whole without the permission of the copyright owner. This includes posting materials to third-party file-sharing sites such as assignment-sharing or homework help sites. Course material includes teaching material, assignment questions, tests, and presentations created by faculty, other members of the Seneca community, or other copyright owners.

> It is also prohibited to reproduce or post to a third-party commercial website work that is either your own work or the work of someone else, including (but not limited to) assignments, tests, exams, group work projects, etc. This explicit or implied intent to help others may constitute a violation of [Seneca’s Academic Integrity Policy](https://www.senecacollege.ca/about/policies/academic-integrity-policy.html) and potentially involve such violations as cheating, plagiarism, contract cheating, etc.  

> These prohibitions remain in effect both during a student’s enrollment at the college as well as withdrawal or graduation from Seneca.
