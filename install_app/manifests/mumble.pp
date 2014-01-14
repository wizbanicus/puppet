# Class: install_app::mumble
# 
# Installs mumble
#
class install_app::mumble {
  case $operatingsystem {
    Darwin: {
    install_app { 'mumble-1.2.3.dmg':
      my_provider  => appdmg,
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}