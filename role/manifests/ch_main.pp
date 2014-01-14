# class role::ch_main
# adds mac_base to ch_macs to comprise the main mac workstation setup.
# The modules are not all multiplatform so well check os here and only run 
# if appropriate
class role::ch_main {
  case $operatingsystem {
    'Darwin': {
      class { '::profile::mac_base': }
      class { '::profile::ch_macs': }
      class { '::profile::shortcuts': }
    }
    default: {
      notifty{'this os is not right for this module': }
    }
  }
}
