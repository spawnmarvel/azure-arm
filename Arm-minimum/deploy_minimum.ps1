$resourceGr1 = "boose-rg1"
$templateFile = "Arm-minimum\template.parameters.json"
New-AzResourceGroupDeployment -Name MinimumTemp -ResourceGroupName $resourceGr -TemplateFile $templateFile  -WhatIf
