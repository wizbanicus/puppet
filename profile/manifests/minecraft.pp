# Class: profile::minecraft
# 
# Installs minecraft
#
class profile::minecraft {
  case $operatingsystem {
    Darwin: {
      file {'ftbdir':
        path   => '/Users/Shared/ftb',
        ensure => directory,
        mode   => 777,
      }
      file {'ftblauncher':
        path => '/Users/Shared/ftb/launcherFTB_Launcher.jar',
        source => '/installers/macos/launcherFTB_Launcher.jar',
        ensure => present,
        require => File['ftbdir'],
      }
      file { 'minecraft launcher link':
        target  => '/Users/Shared/ftb/launcherFTB_Launcher.jar',
        path    => '/Applications/minecraft',
        force   => true,
        require => File['ftblauncher'],
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
