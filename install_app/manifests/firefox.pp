# Class: install_app::firefox
# 
# Installs ff version 26.0
#
class install_app::firefox {
  case $operatingsystem {
    Darwin: {
    install_app { 'Firefox 27.0.1.dmg':
      my_provider  => 'appdmg',
      }
    }

    windows: {
    file { 'Firefox 16.0.1':
      ensure    => present,
      source    => 'puppet:///modules/firefox/Firefox-16.0.1-en-GB.msi',
      path      => 'C:/Program Files/Temp/Firefox-16.0.1-en-GB.msi',
      }
    package { 'firefox':
      ensure    => installed,
      source    => 'C:\Program Files\Temp\Firefox-16.0.1-en-GB.msi',
      require   => File[ 'Firefox 16.0.1' ],
    }  
    }

    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
