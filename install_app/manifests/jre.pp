# Class: install_app::jre
# 
# Installs java runtime environment
#
class install_app::jre {
  case $operatingsystem {
    Darwin: {
    install_app { 'jre-7u51-macosx-x64.dmg': }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
