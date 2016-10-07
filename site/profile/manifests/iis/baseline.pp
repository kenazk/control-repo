class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {

  # Install Dot Net 4.5 first
  windowsfeature { 'DOTNET_FEATURES':
    feature_name => [
      'NET-Framework-45-Core',
      'NET-Framework-45-ASPNET',
      'AS-NET-Framework',
    ]
  } ->
  # Install IIS and dependent features
  windowsfeature { 'IIS_COMPONENTS':
    feature_name => [
      'Web-Server',
      'Web-WebServer',
    ]
  } ->
#   Stop the Default Website
#  iis::manage_site { 'Default Web Site':
#    ensure   => 'Stopped',
#    app_pool => 'DefaultAppPool',
#  }

  file { $root_iis_path:
    ensure => 'directory',
  }
}
