#
# Defined type input_setup
# Sets up keyboard input sources ensuring both english and maori are available.
# ~/Library/Preferences/ByHost/com.apple.HIToolbox.HOSTNAME.plist
#
define input_setup (
$plist=$name,
){
  file {"${plist}":
    source  => "puppet:///modules/input_setup/com.apple.HIToolbox.HOSTNAME.plist",
    ensure  => file,
    owner   => 'root',
    mode    => 700,
  }
}
