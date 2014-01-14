# Class: install_app::scratch
# 
# Sets up scratch
#
class install_app::scratch {
  case $operatingsystem {
    Darwin: {
#      file { 'Scratch.ini':
#        content      => template("install_app/scratch/scratch.erb"),
#        path         => '/Applications/Scratch 1.4/Scratch.ini',
#        require      => Install_app['Scratch1.4.dmg'],
#      }
      install_app { 'MacScratch1.4.dmg':
	my_provider => 'appdmg',
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }  
}
