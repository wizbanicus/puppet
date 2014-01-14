# defined type ::mkscripts::login
# puts login scripts into the login scripts folder for the desired user.
#
define mkscripts::login (
  $user, 
  $script, 
  $indir = $::mkscripts::indir,
)
{
  file{"${indir}${user}/${script}":
    ensure   => present,
    owner    => 'root',
    mode     => 700,
    content  => template("mkscripts/${script}.erb"),
    recurse  => true,
    purge    => true,
  }
}
