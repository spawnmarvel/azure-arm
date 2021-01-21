# Import-Module -Name Az
# If you have a storage account, a container (blob) and a file in that blob, i.e a files called test.ps1 or what ever
# You can access the blob and get that file and store it in home dir, ie transfer it.
$key = Get-Content key.log # go to the storage account\settings\access keys and cp the key 1 or key2, store it in the txt file
# set the context, go to storage account and get the key
$StorageContext = New-AzureStorageContext -StorageAccountName "booseewrqh6admd5mg" -StorageAccountKey $key
Write-Host $StorageContext
# use the context to get the container
$Container = Get-AzureStorageContainer -Name "boosecont" -Context $StorageContext 
Write-Host $Container
Write-Host $Container.Name
# $Container  | Get-Member # just to view methods and properties
# get the blob from the container based on contxt
$blobs = Get-AzureStorageBlob -Container $Container.Name -Context $StorageContext
Write-Host $blobs.Name
# now download the folder by blobs.Name
$file = Get-AzureStorageBlobContent -Container $Container.Name -Context $StorageContext $blobs.Name


# Error offline, but not in shell in the portal
# https://stackoverflow.com/questions/27722205/new-azurestoragecontext-is-not-recognized/27771597
