# minimum deploy
$rgName = "testit2-rg"
$ran = Get-Random -Maximum 100
$deployName = "buildTestVm1" + $ran
$templateFile = ".\template.json"
$templateParameters = ".\template.parameters.json"
$resourceGr = New-AzResourceGroup -Name $rgName -Location "west europe" -Force
New-AzResourceGroupDeployment -Name $deployName -ResourceGroupName $resourceGr.ResourceGroupName `
 -TemplateFile $templateFile -TemplateParameterFile $templateParameters -preFixAccount "account12" -whatif