# defined type ::mkscripts::restore_skel
# removes a user accounts' files and replaces them with files froma  skel dir
#
define mkscripts::map_my_drives (
  $user = $name,
  $indir = $::mkscripts::indir,
  $shares,
# shares should be a hash of key val "share" => "mount"
  $smbuser,
  $smbpw,
  $server,
)
{
  file{"${indir}${user}/map_my_drives.sh":
    ensure   => present,
    owner    => 'root',
    mode     => 700,
    content  => template("mkscripts/map_my_drives.sh.erb"),
  }
}
