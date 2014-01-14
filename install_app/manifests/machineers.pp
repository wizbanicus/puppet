# Class: install_app::machineers
# 
# Installs machineers
#
class install_app::machineers {
  case $operatingsystem {
    Darwin: {
    install_app { 'machineers.dmg':
      my_provider  => appdmg,
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}