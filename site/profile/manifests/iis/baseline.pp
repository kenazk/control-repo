class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {
  # Install IIS and dependent features
  $iis_features = ['Web-Server','Web-Asp-Net45']
  windowsfeature { $iis_features:
    ensure => present,
  } ->
  # Stop the Default Website
  iis_site { 'Default Web Site':
     ensure   => 'stopped',
  }
  # Ensure IIS root path exists
  file { $root_iis_path:
    ensure => 'directory',
  }
}
