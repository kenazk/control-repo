class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {

  # Install Dot Net 4.5 first
#  winfeature{'NET-Framework-45-Core,NET-Framework-45-ASPNET':
#     ensure => 'present',
#  } ->
  # Install IIS and dependent features
#  winfeature{'Web-Server,Web-WebServer':
#     ensure => 'present',
#  }

  $dotnet_features = ['NET-Framework-45-Core','NET-Framework-45-ASPNET']
  $iis_features = ['Web-Server','Web-WebServer','Web-Mgmt-Console','Web-Mgmt-Tools']

  windowsfeature { $dotnet_features:
    ensure => present,
  } ->
  windowsfeature { $iis_features:
    ensure => present,
  } ->
  # Stop the Default Website
#  iis_site { 'Default Web Site':
#     ensure   => 'stopped',
#  }

  file { $root_iis_path:
    ensure => 'directory',
  }
}
