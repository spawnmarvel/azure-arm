Write-Host "Create the rg (it is automatically created if you have not) and vnet (you must create) before you start" -ForegroundColor Yellow
Write-Host "Get context from rg regaring subscriptions and feed it to virtualNetworkId if you need to keep it safe" -ForegroundColor Yellow
# connect to azure first
# Connect-AzAccount
$sub = Get-AzSubscription
$vnet = "testit2-vnet"
$rgName = "testit2-rg"
# create rg
$resourceGr = New-AzResourceGroup -Name $rgName -Location "west europe" -Force
#  check what we have before we start
Write-Host "Get resources in : " $rgName
$group = Get-AzResource -ResourceGroupName $resourceGr.ResourceGroupName

foreach ($g in $group) {
    Write-Host $g.Name + " " $g.Sku.Name
}
# construct the virtualNetworkId (is has been removed from the downloaded paramter file)
$vnetId = "/subscriptions/" + $sub.Id +  "/resourceGroups/" + $resourceGr.ResourceGroupName + "/providers/Microsoft.Network/virtualNetworks/" +$vnet
Write-Host $vnetId
# template file
$templateFile = "C:\giti\azure-arm\Virtual-machine\simple-vm-user-pass\vm_template.json"
# parameter file
$paramterFile = "C:\giti\azure-arm\Virtual-machine\simple-vm-user-pass\vm_paramters.json"
# jepp secure it, and get it from prompt, not like this...
$userName = "testadmin100" # testAdmin100
$passWordSecure = ConvertTo-SecureString "Thisisbadyes123" -AsPlainText -Force
# test it
# New-AzResourceGroupDeployment -Name buildTestVm `
#  -ResourceGroupName $resourceGr.ResourceGroupName `
#  -virtualNetworkId $vnetId `
#  -TemplateFile $templateFile -TemplateParameterFile $paramterFile -adminUsername $userName -adminPassword $passWordSecure -WhatIf
# verbose or debug
New-AzResourceGroupDeployment -Name buildTestVm `
 -ResourceGroupName $resourceGr.ResourceGroupName `
 -virtualNetworkId $vnetId `
 -TemplateFile $templateFile -TemplateParameterFile $paramterFile -adminUsername $userName -adminPassword $passWordSecure -Verbose




