# Creates the Resource Group
class profile::azure::vmss (
  $department        = 'prod',
  $project             = 'FourthCoffeeWebSiteContent.zip',
  $website_name         = 'https://github.com/kenazk/fourthcoffee/raw/master',
  $adminUsername = 'C:\\inetpub\\fourthcoffee',
  $adminPassword            = 'C:\\tmp',
  $puppetMasterFqdn = '',
  $location = 'westus',
) {
  # Ensure Resource Manager template is on the machine
  file { 'C:\\temp':
    ensure => 'directory',
  } ->
  file { 'C:\\temp\\azureDeployjson':
    ensure => 'file',
    source => 'puppet:///scripts/azuredeploy.json'
  }
  #azure_resource_group { $website_name:
  #  ensure         => 'present',
  #  location       => $location,
  #} ->

  # Deploys a VM Scale Set Template
  #azure_resource_template { "${website_name}-dep":
  #  ensure         => 'present',
  #  content        => file('C:\\ProgramData\\PuppetLabs\\code\\environments\\production\\manifests\\templates\\azureDeploy.json'),
  #  resource_group => 'azvmss1',
  #  params         => {
  #    'vmSku' =>  'Standard_A1',
  #    'windowsOSVersion' => '2012-R2-Datacenter',
  #    'vmssName' => 'vmss',
  #    'instanceCount' => 1,
  #    'adminUsername' => 'admin123',
  #    'adminPassword' => 'Admin123_!',
  #    'puppetMasterFqdn' => 'puppetmaster.local',
  #  }
  #}
}
