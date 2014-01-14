#
# Class input_setup
# Sets up keyboard input sources ensuring both english and maori are available.

# ~/Library/Preferences/ByHost/com.apple.HIToolbox.HOSTNAME.plist
#
class input_setup {
# input_prefs_bh_ch - the prefs by host location for clubhouse user
# input_prefs_bh_ad - the prefs by host location for admininistrator user
# bad coding - repetitive and inflexible bu should work for now! 
# 
$input_prefs_bh_ch="/Users/.clubhouse/Library/Preferences/ByHost/com.apple.HIToolbox.${sp_platform_uuid}.plist"
$input_prefs_bh_ad="/Users/Administrator/Library/Preferences/ByHost/com.apple.HIToolbox.${sp_platform_uuid}.plist"

# Note this is bad code - but works - the first one sets it up for the clubhouse user,
# the second for the administrator user. For clubhouse user we set permissions as root
# as we are setting up the template user NOT clubhouse directly.

  file {"${input_prefs_bh_ch}":
    source  => "puppet:///modules/input_setup/com.apple.HIToolbox.HOSTNAME.plist",
    ensure  => file,
    owner   => 'root',
    mode    => 700,
  }
  file {"${input_prefs_bh_ad}":
    source  => "puppet:///modules/input_setup/com.apple.HIToolbox.HOSTNAME.plist",
    ensure  => file,
    owner   => 'administrator',
    mode    => 700,
  }
}
