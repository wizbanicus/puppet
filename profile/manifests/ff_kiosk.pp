# class profile::ff_kiosk
# organises the xscripts files for 
# firefox setup to stay full screen and reopen if closed
# and go to my url
# requires user to exist!
# and requires a bunch of packages
# wmctrl
# x11-xserver-utils (for xrandr)
# openbox
# firefox
# xinit
# flashplugin-installer
# xinit-utils
#
class profile::ff_kiosk (
  $username    = 'kiosk',
  $my_url      = 'http://scratch.mit.edu',
) {
  case $::operatingsystem {
    'Ubuntu': {
      file{"/home/$username/.xinitrc":
	ensure  => present,
        owner   => "$username",
        content => template("profile/ff_kiosk/xinitrc.erb"),
       	mode    => 755,
      }
      file{"/home/$username/.xsession":
	ensure   => link,
  	target   => "/home/$username/.xinitrc",
	require  => File["/home/$username/.xinitrc"],
      }
      file{"/home/$username/.run_ff.sh":
	ensure   => present,
	content  => template("profile/ff_kiosk/run_ff.sh.erb"),
	owner	 => $username,
	mode 	 => 750,
      }
      file{"/home/$username/.kill_ff.sh":
	ensure   => present,
	content  => template("profile/ff_kiosk/kill_ff.sh.erb"),
	owner	 => $username,
	mode 	 => 750,
      }
      file{"/home/$username/.config":
	ensure  => directory,
	owner   => "$username",
	mode    => 750,
      }
      file{"/home/$username/.config/openbox":
	ensure  => directory,
	require => File["/home/$username/.config"],
	owner   => "$username",
	mode    => 750,
      }
      file{"/home/$username/.config/openbox/menu.xml":
	ensure  => file,
	require => File["/home/$username/.config/openbox"],
	owner   => "$username",
	mode    => 750,
	content => template("profile/ff_kiosk/menu.xml.erb"),
      }
    }
    default: {
      fail("your operating system ${::operatingsystem} does not support the class ${name}")
    }
  }
}
