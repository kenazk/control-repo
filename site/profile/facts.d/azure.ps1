## Name: azure.ps1
## Author: kenaz@puppet.com
## Description: Custom fact for determining whether a Windows VM is running in Azure
## For a more detailed implementation, see here https://gallery.technet.microsoft.com/scriptcenter/Detect-Windows-Azure-aed06d51

# Get the SMBIOS Asset Tag
$systemEnclosure = Get-WmiObject -class Win32_SystemEnclosure -namespace root\CIMV2

# Compares tag to known value
if ($systemEnclosure.SMBIOSAssetTag -eq "7783-7084-3265-9085-8269-3286-77")
{
  Write-Host "azure_vm=true"
}
else
{
  Write-Host "azure_vm=False"
}
