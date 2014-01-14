# 
# defined type users::create
# 
define users::create (
  $user,
  $uid,
  $pwd,
  $salt,
  $itns,
  $gid,
  $skel,
)
{
  user{"$user":
    ensure     => present,
    home       => "/Users/${user}",
    password   => $pwd,
    salt       => $salt,
    iterations => $itns,
    uid        => $uid,
    gid        => $gid,
  }
  file{"/Users/${user}":
    ensure  => directory,
    owner   => $user,
    mode    => 755,
    require => User["$user"],
    source  => $skel,
    recurse => remote,
  }
}
