class profile::iis::fourthcoffee (
  $websitename        = 'FourthCoffee',
  $zipname            = 'FourthCoffeeWebSiteContent.zip',
  $sourcerepo         = 'https://github.com/msutter/fourthcoffee/raw/master',
  $destinationpath    = 'C:\\inetpub\\FourthCoffee',
  $defaultwebsitepath = 'C:\\inetpub\\wwwroot',
  $zippath            = 'C:\\tmp'
) {

  $zipuri  = "${sourcerepo}\\${zipname}"
  $zipfile = "${zippath}\\${zipname}"

  file { [$zippath, $destinationpath, $defaultwebsitepath]:
    ensure => 'directory',
  }
}
