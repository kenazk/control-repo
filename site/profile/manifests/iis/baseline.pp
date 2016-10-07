class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {

  # Install Dot Net 4.5 first
  $dot_net = [
    'NET-Framework-45-Core',
    'NET-Framework-45-ASPNET',
    'AS-NET-Framework',
  ]
  windowsfeature { 'dot_net':
    ensure => present,
  } ->
  # Install IIS and dependent features
  windowsfeature { 'Web-Server':
    ensure                  => present,
    installmanagementtools  => true,
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
