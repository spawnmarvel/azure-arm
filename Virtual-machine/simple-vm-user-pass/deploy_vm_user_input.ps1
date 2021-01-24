# Use keyvault or
# The username and password for the VM are converted to a secure string and system object.
$str =  Get-Date
Write-Host "Predeploy " $str
Write-Host "Provide a password (length > 12) for the admin user"
$userName = "testadmin100" # testAdmin100
$passWord = Read-Host # -AsSecureString
if ($passWordSecure.length -le  12) {
    Write-Host "Adding suffix to pass word, due to length must be > 12" -ForegroundColor Yellow
    $passWord += "longpass"
}
Write-Host "Provided:" $passWord
$passWordSecure = ConvertTo-SecureString $passWord -AsPlainText -Force
Write-Host "Secure:" $passWordSecure
$creds = New-Object System.Management.Automation.PSCredential($userName, $passWordSecure)

Write-Host "Provided: " $userName ", " $passWord
Write-Host "Secured: " $passWordSecure ", " $creds

Write-Host "Begin construct deployment....."
# create the resource group
$rgName = "testit2-rg"
$resourceGr = New-AzResourceGroup -Name $rgName -Location "west europe" -Force
Write-Host "Resource group created:"
Write-Host $resourceGr.ResourceGroupName $resourceGr.Location

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
# extensions is emptty now, will add when template works!!!




