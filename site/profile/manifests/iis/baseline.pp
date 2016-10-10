class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {

  $dotnet_features = ['NET-Framework-45-Core']
  $iis_features = ['Web-Server','Web-Asp-Net45']

  # Install Dot Net 4.5 first
  #windowsfeature { $dotnet_features:
  #  ensure => present,
  #} ->
  # Install IIS and dependent features
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
