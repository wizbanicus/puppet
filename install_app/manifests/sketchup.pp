# Class: install_app::scetchup
# 
# Installs sketchup
#
class install_app::sketchup {
  case $operatingsystem {
    Darwin: {
    install_app { 'sketchup.pkg': }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
