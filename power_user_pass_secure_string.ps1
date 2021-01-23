# Use keyvault or
# The username and password for the VM are converted to a secure string and system object.
$str =  Get-Date
Write-Host "Predeploy " $str
Write-Host "Provide a password (length > 12) for the admin user"
$userName = "testadmin"
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
