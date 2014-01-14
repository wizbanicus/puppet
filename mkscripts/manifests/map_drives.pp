# class mkscripts::map_drives
# loads a daemon which reqularly runs a script to map the drives for a user.
# The script simply checks to see if there is a map_drives.sh in 
# the login.d scripts folder for the user.
# To be effective you'll want to also use map_my_drives
# to place the user map drives file in the correct login.d 
# folder.
# if that exists it is run.
# Then it maps systemwide drives
#
class mkscripts::map_drives (
$scriptdir = '/Library/Management/login.d',
$usrscript = 'map_my_drives.sh',
$depot_user = false,
$depot_pw = false,
$depot_mount = '/installers',
$depot_server = false,
$depot_share = false,
){
  file { '/Library/Management/map_drives.sh':
    content   => template("mkscripts/map_drives.sh.erb"),
    ensure    => file,
    owner     => root,
    group     => wheel,
    mode      => 700,
  }
  exec { load_deamon:
    command     => '/bin/launchctl load -w /Library/LaunchDaemons/org.awacity.map_drives.plist',
    subscribe   => File['/Library/LaunchDaemons/org.awacity.map_drives.plist'],
    refreshonly => true,
  }
  file { '/Library/LaunchDaemons/org.awacity.map_drives.plist':
    source    => "puppet:///modules/mkscripts/org.awacity.map_drives.plist",
    ensure    => file,
    owner     => root,
    group     => wheel,
    mode      => 744,
  }
  file { "${depot_mount}" :
    ensure => directory,
  }
}
