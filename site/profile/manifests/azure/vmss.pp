# Creates the Resource Group
class profile::azure::vmss (
  $department         = 'prod',
  $project            = 'puppetconf',
  $website_name       = 'fourthcoffee',
  $adminUsername      = 'admin123',
  $adminPassword      = 'Admin123_!',
  $puppetMasterFqdn   = 'puppet0cbe.westus.cloudapp.azure.com',
  $location           = 'westus',
) {
  # Ensure Resource Manager template is on the machine
  file { 'C:/temp':
    ensure => 'directory',
  } ->
  file { 'C:/temp/azureDeploy.json':
    ensure => 'file',
    source => 'puppet:///modules/azure/azuredeploy.json'
  }
  azure_resource_group { $website_name:
    ensure         => 'present',
    location       => $location,
  } ->

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
