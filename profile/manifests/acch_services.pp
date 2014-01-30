# class profile::acch_services
# kills notifications on os x
#
class profile::acch_services {
  service { 'com.apple.notificationcenterui.agent':
    ensure => 'running',
    enable => 'true',
  }
  service { 'com.apple.notifyd':
    ensure => 'running',
    enable => 'true',
  }
  service { 'com.puppetlabs.puppet':
    ensure => 'stopped',
    enable => 'false',
  }
}
