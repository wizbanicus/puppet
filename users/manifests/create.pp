# 
# defined type users::create
# 
define users::create (
  $user=$name,
  $uid,
  $pwd,
  $salt,
  $itns,
  $gid,
  $skel,
  $home = "/Users/${name}",
)
{
  user { "${user}":
    ensure     => present,
    home       => $home,
    password   => $pwd,
    salt       => $salt,
    iterations => $itns,
    uid        => $uid,
    gid        => $gid,
  }
  notify { "${home}": }
  file{"/Users/${user}":
    ensure  => directory,
    owner   => $user,
    mode    => 755,
    require => User["${user}"],
    source  => $skel,
    recurse => remote,
  }
}
