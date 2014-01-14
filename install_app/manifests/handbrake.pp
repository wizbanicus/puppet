# Class: install_app::handbrake
# 
# Installs handbrake
#
class install_app::handbrake {
  case $operatingsystem {
    Darwin: {
    install_app { 'HandBrake-0.9.9-MacOSX.6_GUI_x86_64.dmg':
      my_provider  => appdmg,
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
