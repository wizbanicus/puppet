# class role::acch_basic
# temporary just to get the drives mapped for day 1
class role::acch_basic {
  case $operatingsystem {
    'Darwin': {
      class { '::profile::acch_shares': }
      class { '::mkscripts':
        users => [ 'clubhouse' ],
      }
      mkscripts::launchd{ "com.puppetlabs.puppet.plist": }
    }
    default: {
      notifty{'this os is not right for this module': }
    }
  }
}
