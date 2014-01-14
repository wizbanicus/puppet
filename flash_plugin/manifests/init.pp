# Class: flash_plugin
# 
# Installs flashplugin to version specified (and downloaded)
# 
# added silent auto update feature 22-11-2012
# Adding parameters to choose whether to set updates to auto, or off
# by default auto updating is turned off by this class through the
# mms.cfg file, however the parameter can allow it to turn on.
# The auto-updates will work only within the same version, however 
# new major versions will still need a fresh install. 
# The flash_version parameter is just for the purposes of making the exec run only once.
# Just like puppet installed packages, it adds a file to /var/db/ 
# so as well as declaring the version - you still need to add the actual dmg 
# to the ftp server!
#
class flash_plugin( 
# Class parameters go here!
  $auto_update_disable = 1, 
  $auto_update_interval = 0, 
  $silent_auto_update_enable = 0,
  $flash_version = '11_9_900_152',
  $our_source= "/installers/macos/install_flash_player_osx.dmg",
 ) {
  case $operatingsystem {

    Darwin: {
# using custom facts from install_app module
    if !$::manually_installed_flash_plugin_11_9_900_152 {
       notify{ "flash version ${flash_version} is not installed, installing :)": }
    
    package { 'install_flash_player_osx.dmg':
      name	=> "install_flash_player_osx_${flash_version}",
      ensure    => installed,
      provider  => appdmg,
      source    => $our_source,
      }
  
#
#   NOTE: we are using this file to control installation of flash plugin.
#   When there is a new version all we need to do it change the version below
#

    file {"/var/db/.puppet_manually_installed_flash_plugin_${flash_version}":
      ensure    => file,
      require   => Exec['install_flash_player'],
    }

# Whacky messy work around - once the installer has run delete it from /Applications.
# Because we are using the custom fact taken from "/var/db/" none of this will be run again untill 
# we decide to update flash again - giving it a new version number 

    
    exec {'install_flash_player':
      creates   => "/var/db/.puppet_manually_installed_flash_plugin_${flash_version}",
      require   => Package['install_flash_player_osx.dmg'],
      cwd       => '/Applications/Install Adobe Flash Player.app/Contents/MacOS/',
      command   => '/Applications/Install\ Adobe\ Flash\ Player.app/Contents/MacOS/Adobe\ Flash\ Player\ Install\ Manager -install',
      provider  => shell,
    }
     
    file { '/Library/Application Support/Macromedia/mms.cfg':
      ensure    => file,
      content   => template("flash_plugin/mms.cfg.erb"),
      require   => Exec['install_flash_player'],
     }
    } 
  else {
    file { 'remove_installer':
      path      => '/Applications/Install Adobe Flash Player.app',
      ensure    => absent,
      recurse   => true,
      force     => true,
    }

    file { 'remove_installer_touch':
      path      => '/var/db/.puppet_appdmg_installed_install_flash_player_osx.dmg',
      ensure    => absent,
      recurse   => true,
      force     => true,
      require   => File['remove_installer'],
      }
    }
  }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}
