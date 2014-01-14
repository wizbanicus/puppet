# Class: scratch
# 
# Sets up scratch
#
class scratch {
  case $operatingsystem {
    Darwin: {
      file { 'Scratch.ini':
        content      => template("scratch/scratch.erb"),
        path         => '/Applications/Scratch 1.4/Scratch.ini',
        require      => File['scratch'],
      }
      file { 'scratch':
        ensure   => present,
        recurse  => true,
        source   => '/mnt/installers/macos/Scratch 1.4',
        path     => '/Applications/Scratch 1.4',
        mode     => 755,
      }
    }
    default: {
      notify {"the operating system ${operatingsystem} is not supported":}
    }
  }  
}