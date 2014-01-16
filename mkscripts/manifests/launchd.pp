# defined type mkscripts::launchd
# enables installing and config of laucnhdaemons
# ideal for setting puppet to run automatically
# the plist file must be put in /mkscripts/files/ for this to work.
# 
define mkscripts::launchd (
$plist=$name,
) {
  file { "${plist}":
    path    => "/Library/LaunchDaemons/${plist}",
    ensure  => present,
    source  => "puppet:///modules/mkscripts/${plist}",
    owner   => 'root',
    mode    => 644,
  }
  exec { "${plist}":
    command   => "/bin/launchctl load -w /Library/LaunchDaemons/${plist}",
    subscribe => File["${plist}"],
    refreshonly => true,
  }
}
