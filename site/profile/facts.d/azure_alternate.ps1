## Name: azure_alternate.ps1
## Author: kenaz@puppet.com
## Description: Alternate custom fact for determining whether a Windows VM is running in Azure

# Get the SMBIOS Asset Tag
$systemEnclosure = Get-WmiObject -class Win32_SystemEnclosure -namespace root\CIMV2

# Compares tag to known value
if ($systemEnclosure.SMBIOSAssetTag -eq "7783-7084-3265-9085-8269-3286-77")
{
  Write-Host "azure_vm_alternate=true"
}
else
{
  Write-Host "azure_vm_alternate=False"
}
