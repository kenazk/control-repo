class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {

  # Install Dot Net 4.5 first
  windowsfeature { 'DOTNET_CLOUDSHOP_SERVER':
    feature_name => [
      'NET-Framework-45-Core',
      'NET-Framework-45-ASPNET',
      'AS-NET-Framework',
    ]
  } ->
  # Install IIS and dependent features
  windowsfeature { 'IIS_FOURTHCOFFEE_SERVER':
    feature_name => [
      'Web-Server',
    ]
  } ->
  # Stop the Default Website
  iis_site { 'Default Web Site':
    ensure   => 'Stopped',
    app_pool => 'DefaultAppPool',
    ip       => '*',
    path     => 'C:\\InetPub\\WWWRoot',
    port     => '80',
    protocol => 'http',
    ssl      => 'false',
  }

  file { $root_iis_path:
    ensure => 'directory',
  }
}
