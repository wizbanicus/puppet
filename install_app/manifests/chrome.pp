class install_app::chrome {
  install_app { 'googlechrome.dmg':
    my_provider => appdmg,
  }
  if !$appdmg_installed_googlechrome_dmg {
    exec { 'unquarantine chrome':
      command  => '/usr/bin/xattr -d com.apple.quarantine /Applications/Google\ Chrome.app/',
      require  => Install_app['googlechrome.dmg'],
    }
  }
}

