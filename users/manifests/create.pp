# 
# defined type users::create
# 
define users::create (
  $user=$name,
  $uid,
  $gid,
  $skel,
  $home = "/Users/${name}",
)
{
  user { "${user}":
    ensure     => present,
    home       => "${home}",
    uid        => "${uid}",
    gid        => "${gid}",
  }
  file{"/Users/${user}":
    ensure  => directory,
    owner   => "${user}",
    mode    => 755,
    require => User["${user}"],
  }
}
