#
# Defined type input_setup
# Sets up keyboard input sources ensuring both english and maori are available.
# ~/Library/Preferences/ByHost/com.apple.HIToolbox.HOSTNAME.plist
#
define input_setup (
$userhome=$name,
$prefsdir='Library/Preferences/ByHost',
$plist='com.apple.HIToolbox',
$uuid=$::sp_platform_uuid,
){
  file {"${userhome}/${prefsdir}/${plist}.${uuid}.plist":
    source  => "puppet:///modules/input_setup/com.apple.HIToolbox.HOSTNAME.plist",
    ensure  => file,
    owner   => 'root',
    mode    => 700,
    require => File["${userhome}/${prefsdir}"],
  }
  file {"${userhome}/${prefsdir}":
    ensure => directory,
    force  => true,
  }
}
