# Class: install_app::minecraft
# 
# Installs minecraft
#
class install_app::minecraft {
  case $operatingsystem {
    Darwin: {
      install_app { 'minecraft.pkg': }
      file { 'minecraft launcher link':
        target  => '/Users/Shared/ftb2/launcherFTB_Launcher.jar',
        path    => '/Applications/minecraft',
        force   => true,
        require => Install_app['minecraft.pkg'],
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }
}  
