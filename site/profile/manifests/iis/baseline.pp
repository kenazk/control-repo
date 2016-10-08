class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {

  # Install Dot Net 4.5 first
  winfeature{'NET-Framework-45-Core,NET-Framework-45-ASPNET':
     ensure => 'present',
  } ->
  # Install IIS and dependent features
  winfeature{'Web-Server,Web-WebServer':
     ensure => 'present',
  } ->
#   Stop the Default Website
  iis_site { 'Default Web Site':
     ensure   => 'Stopped',
  }

  file { $root_iis_path:
    ensure => 'directory',
  }
}
