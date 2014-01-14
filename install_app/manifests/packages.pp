# Class: install_app::packages
# 
# Installs packages
#
class install_app::packages {
  case $operatingsystem {
    Darwin: {
    install_app { 'Packages.pkg':
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
