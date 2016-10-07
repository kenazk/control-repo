class 'profile::iis::motd':
  class { 'motd':
    content => "This got updated #2.",
  }
}
