class profile::iis::fourthcoffee (
  $websitename        = 'FourthCoffee',
  $zipname            = 'FourthCoffeeWebSiteContent.zip',
  $sourcerepo         = 'https://github.com/kenazk/fourthcoffee/raw/master',
  $defaultwebsitepath = 'C:\\inetpub\\fourthcoffee',
  $zippath            = 'C:\\tmp'
) {

  $zipuri  = "${sourcerepo}/${zipname}"
  $zipfile = "${zippath}\\${zipname}"

  file { [$zippath, $defaultwebsitepath]:
    ensure => 'directory',
  }

  # Stage the FourthCoffee Website
  exec { 'DownloadFourthCoffee':
    command => "iwr -uri '${zipuri}' -OutFile '${zipfile}'",
    provider => powershell,
    creates => $zipfile,
  }
  unzip { "FourthCoffee Web Data ${zipname}":
    source    => $zipfile,
    creates   => "${defaultwebsitepath}\\Global.asax",
    require   => [ File[$defaultwebsitepath], Exec['DownloadFourthCoffee'] ],
  }

  # Setting up FourthCoffee
  iis_site { 'FourthCoffee Web Site':
    ensure   => 'started',
    app_pool => 'DefaultAppPool',
    ip       => '*',
    path     => $defaultwebsitepath,
    port     => '80',
    protocol => 'http',
    ssl      => 'false',
  }
}
