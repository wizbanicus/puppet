# Class: install_app::minecraft
# 
# Installs minecraft
#
class install_app::minecraft {
  case $operatingsystem {
    Darwin: {
    install_app { 'Minecraft.dmg':
      my_provider  => appdmg,
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
