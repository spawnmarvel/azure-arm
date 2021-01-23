# connect
# Connect-AzAccount

$rgName = "testit-rg"
$resourceGr = New-AzResourceGroup -Name $rgName -Location "west europe" -Force

$templateFile = "C:\giti\azure-arm\Vm\simple-vm-user-pass\vm_template.json"
$paramterFile = "C:\giti\azure-arm\Vm\simple-vm-user-pass\vm_paramters.json"
$passWordSecure = ConvertTo-SecureString "testAdmin100" -AsPlainText -Force
New-AzResourceGroupDeployment -Name addOutputs -ResourceGroupName $resourceGr -TemplateFile $templateFile -adminPassword $passWordSecure -WhatIf


