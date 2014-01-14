# class profiles::minimalx
# ensures we have all the packages required for a minimal x setup
# uses openbox
# and comes with firefox and flashplugin.
# also allows proxy server to be set
class profile::minimalx (
) {
  case $::operatingsystem {
    'Ubuntu': {
      package{'wmctrl':
        ensure => installed,
      }
      package{'xinit':
        ensure => installed,
      }
      package{'openbox':
        ensure => installed,
      }
      package{'firefox':
        ensure => installed,
      }
      package{'flashplugin-installer':
        ensure  => installed,
	require => Package['firefox'],
      }
      package{'xautolock':
        ensure => installed,
      }
      package{'x11-xserver-utils':
        ensure => installed,
      }
      package{'x11-utils':
        ensure => installed,
      }
    }
    default: {
      fail("your operating system ${::operatingsystem} does not support the class ${name}")
    }
  }
}
