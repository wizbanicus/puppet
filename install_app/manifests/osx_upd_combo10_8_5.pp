# Class: install_app::osx_upd_combo10_8_5
# 
# Installs os x update
#
class install_app::osx_upd_combo10_8_5 {
  case $operatingsystem {
    Darwin: {
    install_app { 'OSXUpdCombo10.8.5.dmg': }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}
