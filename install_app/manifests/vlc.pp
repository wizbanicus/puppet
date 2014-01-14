# Class: install_app::vlc
# 
# Installs vlc
#
class install_app::vlc {
  case $operatingsystem {
    Darwin: {
    install_app { 'vlc-2.0.7.dmg':
      my_provider  => appdmg,
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
