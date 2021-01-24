Write-Host "Get context from rg regaring subscriptions feed it to virtualNetworkId"
# connect
# Connect-AzAccount
$rgName = "testit2-rg"
$resourceGr = New-AzResourceGroup -Name $rgName -Location "west europe" -Force
# template file
$templateFile = "C:\giti\azure-arm\Vm\simple-vm-user-pass\vm_template.json"
# parameter file
$paramterFile = "C:\giti\azure-arm\Vm\simple-vm-user-pass\vm_paramters.json"
# jepp secure it, and get it from prompt, not like this...
$userName = "testadmin100" # testAdmin100
$passWordSecure = ConvertTo-SecureString "Thisisbadyes123" -AsPlainText -Force
# test it
# New-AzResourceGroupDeployment -Name buildTestVm `
#  -ResourceGroupName $resourceGr.ResourceGroupName `
#  -TemplateFile $templateFile -TemplateParameterFile $paramterFile -adminUsername $userName -adminPassword $passWordSecure -WhatIf
# verbose or debug
New-AzResourceGroupDeployment -Name buildTestVm `
 -ResourceGroupName $resourceGr.ResourceGroupName `
 -TemplateFile $templateFile -TemplateParameterFile $paramterFile -adminUsername $userName -adminPassword $passWordSecure -Verbose




