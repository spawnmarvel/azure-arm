$resourceGr1 = "boose-rg1"
$templateFile = "Arm-minimum\template.parameters.json"
$templateParameters = "Arm-minimum\template.parameters.json"
New-AzResourceGroupDeployment -Name MinimumTemp -ResourceGroupName $resourceGr -TemplateFile $templateFile -TemplateParameterFile $templateParameters -WhatIf
