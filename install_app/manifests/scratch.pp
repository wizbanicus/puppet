# Class: install_app::scratch
# 
# Sets up scratch
#
class install_app::scratch {
  case $operatingsystem {
    Darwin: {
      file { 'Scratch.ini':
        content      => template("install_app/scratch/scratch.erb"),
        path         => '/Applications/Scratch 1.4/Scratch.ini',
        require      => Install_app['scratch1.4.pkg'],
      }
      install_app { 'scratch1.4.pkg': }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }  
}
