# class role::testmac
# adds mac_base to ch_macs to comprise the main mac workstation setup.
# The modules are not all multiplatform so well check os here and only run 
# if appropriate
class role::testmac {
  case $operatingsystem {
    'Darwin': {
      class { '::profile::mac_base': }
#      class { '::profile::ch_macs': }
#      class { '::profile::shortcuts': }
      class { '::profile::jim': }
      class { '::profile::acch_shares': }
#      class { '::profile::shortcuts': }
      class { '::mkscripts':
        users => [ 'jim', 'administrator' ],
      }
    }
    default: {
      notifty{'this os is not right for this module': }
    }
  }
}
