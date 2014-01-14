# class role::kiosk
# uses profiles ff_kiosk, autologin and minimalx to
# organise the xscripts files
# automatic login as user
# firefox setup to stay full screen and reopen if closed
# and go to my url
class role::kiosk (
  $username    = 'kiosk',
  $my_url      = 'http://scratch.mit.edu',
  $graphical   = true,
  $proxyserver = false,
) {
  case $::operatingsystem {
    'Ubuntu': {
      class { '::profile::minimalx': }
      class { '::profile::proxyclient': 
        proxyserver => $proxyserver,
      }
      class { '::profile::autologin':
        require   => Class['profile::minimalx'],
	username  => $username,
	graphical => $graphical,
      }
      class { '::profile::ff_kiosk':
	require  => Class['::profile::autologin'],
	my_url   => $my_url,
	username => $username,
      }
    }
    default: {
      fail("your operating system ${::operatingsystem} does not support the class ${name}")
    }
  }
}
