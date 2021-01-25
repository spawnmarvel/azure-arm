
$vnet = "testit2-vnet"
$rgName = "testit2-rg"
$resourceGr = New-AzResourceGroup -Name $rgName -Location "west europe" -Force
Write-Host "Rg and vnet must be present" -ForegroundColor Yellow
Write-Host "Must also use a random generator for -Name on deploy"
$ran = Get-Random -Maximum 100
$deployName = "buildTestVm1" + $ran + 100
Write-Host "Deploy nr "  $deployName

# 1 Azure portal atributes
# Virtual machine name test-vm8080
# Availability zone, 1
# Ubuntu Server 18.04 LTS - GEN1
# Standard_BS1s - 1 vpcu, 1 gb memory A$12/mon
# Administrator account password
# Public inbound ports, allow SHH 22
# Disk standard, HDD
# Virtual net, testit-vnet
# Subnet default, 10.0.0.0/24
# Public ip, (new) test-vm-ip
# Public inbound ports, allow SHH 22
# Boot diagnostics, Disable
# Download template for automation
# extensions is empty now

# 2 download template for automation

# 3 cp template to this file
$templateFile = "C:\giti\azure-arm\x_workshop\azure_template.json"
# 4 cp paramter to this file
$paramterFile = "C:\giti\azure-arm\x_workshop\azure_paramters.json"
# username
$userName = "testadmin100" # Remember to sett it to null in parameter
# this is of course bad, use keyvault or prompt
$passWordSecure = ConvertTo-SecureString "Thisisbadyes123" -AsPlainText -Force
# test it
New-AzResourceGroupDeployment -Name $deployName `
  -ResourceGroupName $resourceGr.ResourceGroupName `
  -TemplateFile $templateFile -TemplateParameterFile $paramterFile -adminUsername $userName -adminPassword $passWordSecure -WhatIf


