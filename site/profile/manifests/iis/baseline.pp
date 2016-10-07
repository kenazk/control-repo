class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {

  # Install Dot Net 4.5 first
  winfeature{'NET-Framework-45-Core,NET-Framework-45-ASPNET':
     ensure => 'present',
     allsubfeatures => true,
     concurrent => true,
  } ->
  # Install IIS and dependent features
  winfeature{'Web-Server,Web-WebServer':
     ensure => 'present',
     allsubfeatures => true,
     concurrent => true,
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
