# class profile::no_nofity
# kills notifications on os x
#
class profile::no_notify {
  service { 'com.apple.notificationcenterui.agent':
    ensure => 'stopped',
    enable => 'false',
  }
  service { 'com.apple.notifyd':
    ensure => 'stopped',
    enable => 'false',
  }
}
