# defined type ::mkscripts::restore_skel
# removes a user accounts' files and replaces them with files froma  skel dir
#
define mkscripts::restore_skel (
  $user=$name, 
  $outdir = $::mkscripts::outdir,
  $skel,
  $userhome,
  $backupdir = false,
  $links = false,
  $mountpoints = false,
  $kildirs = false,
)
{
  file{"${outdir}${user}/restore_skel.sh":
    ensure   => present,
    owner    => 'root',
    mode     => 700,
    content  => template("mkscripts/restore_skel.sh.erb"),
  }
}

