class install_app::mindstorms {
  if !$apple_installed_mindstorms_mpkg_2 {
    install_app { 'LEGOMindstormsEngRet.mpkg':
      src_dir     => '/mnt/installers/macos/MINDSTORMS NXT',
      my_provider => 'apple',
    }
    exec {'/usr/bin touch /var/db/.puppet_apple_installed_mindstorms_mpkg_2':
      require => Install_app['LEGOMindstormsEngRet.mpkg'],
    }
    file { 'plugins_dir':
      path    => '/Applications/LEGO MINDSTORMS NXT/MINDSTORMS NXT.app/Contents/MacOS/plugins',
      ensure  => directory,      
      require => Install_app['LEGOMindstormsEngRet.mpkg'],
    }
    file {'plugin':
      source  => 'puppet:///modules/install_app/mindstorms_flash_plugin/Flash Player.plugin',     
      ensure  => present,
      recurse => true,
      path    => '/Applications/LEGO MINDSTORMS NXT/MINDSTORMS NXT.app/Contents/MacOS/plugins/Flash Player.plugin',
      require => File['plugins_dir'],
    }
# If we are installing mindstorms it will kill flash - so lets make sure we don't think flash is installed
# We'll kill the flash /usr/bin touch from /var/db.
# basically this means each time we install mindstorms, flash with reinstall itself too
    exec { 'kill_flash' :
      command  => "rm -f /var/db/.puppet_manually_installed_flash_plugin*",
      provider => shell,
    }   
  }
  else {
    exec { touch_plugin :
    command  => '/usr/bin touch /Applications/LEGO\ MINDSTORMS\ NXT/MINDSTORMS\ NXT.app/Contents/MacOS/plugins/*',
    provider => shell,
    }
  } 
}