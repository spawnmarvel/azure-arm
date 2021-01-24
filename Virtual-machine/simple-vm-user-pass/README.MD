# Simple vm with username and password from script
### If you have a rg and a vnet, here is how to make a vm with the following installed and connect it to the vnet
#### (Make it in the portal first, without creating it, just get to the finish step and download for automation.)

### Resource group and vnet used: 
* testit2-rg
* testit2-vnet

#### A note about vnet:
#### When you create or update a virtual network in your subscription, Network Watcher will be enabled automatically in your Virtual Network's region. There is no impact to your resources or associated charge for automatically enabling Network Watcher. With the vnet mentionedwe got the folowing resources:
[![Screenshot](x_networkwatcher.jpg)

### The information provided in the Portal:

* Virtual machine name test-vm8080
* Availability zone, 1
* Ubuntu Server 18.04 LTS - GEN1
* Standard_BS1s - 1 vpcu, 1 gb memory A$12/mon
* Administrator account password
* Public inbound ports, allow SSH 22
* Disk standard, HDD
* Virtual net, testit-vnet
* Subnet default, 10.0.0.0/24
* Public ip, (new) test-vm-ip
* Public inbound ports, allow SHH 22
* Boot diagnostics, Disable
* extensions is empty now, will add when template works

#### Download the template and parameter for automation
### Changes in the template, most important is (if you not want to change anything just (a rg, templatefile, paramterfile and New-AzResourceGroupDeployment with just tha main paramters(rg, tempfile, paramfile and user + password))):
```ps1
# From the template file you download you get the virtual network id as:
"virtualNetworkId": {
            "type": "string"
        },
# From the parameter file you download you get the virtual network id as:
"virtualNetworkId": {
            "value": "/subscriptions/an-id-xxxxxx-x-x-x-x-x-x-x-x/resourceGroups/testit2-rg/providers/Microsoft.Network/virtualNetworks/testit2-vnet"
            
        },
# We changed it to get it dynamically:
# From the parameter file you download, we changed to:
 "virtualNetworkId": {
            "value": null
            
        },
# And feed it like this:
$sub = Get-AzSubscription
# [..]
# construct the virtualNetworkId (is has been removed from the downloaded paramter file)
$vnetId = "/subscriptions/" + $sub.Id +  "/resourceGroups/" + $resourceGr.ResourceGroupName + "/providers/Microsoft.Network/virtualNetworks/" +$vnet
```

#### Run deploy_vm_simple.ps1 for testing, change to -Verbose for actual deploy
```ps1
# template file
$templateFile = "C:\giti\azure-arm\Vm\simple-vm-user-pass\vm_template.json"
# parameter file
# [...]
$paramterFile = "C:\giti\azure-arm\Vm\simple-vm-user-pass\vm_paramters.json"
New-AzResourceGroupDeployment -Name buildTestVm `
  -ResourceGroupName $resourceGr.ResourceGroupName `
  -TemplateFile $templateFile -TemplateParameterFile $paramterFile `
  -adminUsername $userName -adminPassword $passWordSecure -WhatIf
```
### Secure the password if not using keyvault
#### Run deploy_vm_user_input.ps1 for testing, change to -Verbose for actual deploy

###  Verify the build
####  Open putty and connect
[![Screenshot](x_putty.jpg)

# 
### Build, steps and result
[![Screenshot](x_setup_1.jpg)