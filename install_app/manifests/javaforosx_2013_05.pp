# Class: install_app::javaforosx_2013_05
# 
# Installs java
#
class install_app::javaforosx_2013_05 {
  case $operatingsystem {
    Darwin: {
    install_app { 'JavaForOSX2013-05.dmg': }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
