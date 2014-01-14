# class profile::autologin
# organises xinit and bashrc to arrange for
# automatic login as user
# if graphical is chosen you'll need an x to run
# works only without a login manager!
class profile::autologin (
  $username = 'kiosk',
  $graphical = true,
) {
  case $::operatingsystem {
    'Ubuntu': {
      file{'/etc/init/tty1.conf':
	ensure   => present,
	content  => template("profile/autologin/tty1.conf.erb"),
	require  => User["$username"],
      }
      if $graphical {
        file{"/home/$username/.bashrc":
  	  ensure   => present,
	  content  => template("profile/autologin/bashrc.erb"),
	  require  => User["$username"],
        }
      }
      user{"$username":
        ensure 		 => 'present',
        comment          => "$username,,,",
        home             => "/home/$username",
    	password 	 => '$6$kbKZeO75$mYKSmgewZevhDj8GJcz21a3IsCXHmj78mhenR0slqqArXh4UBKJXvyU4EVDMGdJvXcEHsJlgRntB9uagcZd9j0',    
	password_max_age => '99999',
    	password_min_age => '0',
    	shell            => '/bin/bash',
    	uid              => '1010',
	managehome	 => true,
      }
    }
    default: {
      fail("your operating system ${::operatingsystem} does not support the class ${name}")
    }
  }
}
