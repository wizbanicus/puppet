# defined type ::mkscripts::logout
# puts login scripts into the logout scripts folder for the desired user.
# and remove any that should not be there
define mkscripts::logout (
  $user, 
  $script,
  $ensure = present,
  $outdir = $::mkscripts::outdir,
  $params = false,
)
{
  file{"${outdir}${user}/${script}":
    ensure   => $ensure,
    owner    => 'root',
    mode     => 700,
    content  => template("mkscripts/${script}.erb"),
    recurse  => true,
    purge    => true,
  }
}

