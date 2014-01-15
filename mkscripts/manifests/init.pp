# class mkscripts
#
# sets up some login scripts to be run by root for users
class mkscripts (
  $users = [],
  $mgdir = '/Library/Management/',
  $indir = '/Library/Management/login.d/',
  $outdir = '/Library/Management/logout.d/'
)
{
  ::mkscripts::for_users{ [$users] :
    indir   => $indir,
    outdir  => $outdir,
    require => [ File[$indir], File[$outdir] ],
  }
  file{"${mgdir}":
    ensure   => directory,
    recurse  => true,
    purge    => true,
  }
  file{"${mgdir}login.sh":
    ensure  => present,
    content => template("mkscripts/login.sh.erb"),
    require => File["loginwindow"],
    owner   => root,
    mode    => 700,
  }
  file{"${mgdir}logout.sh":
    ensure  => present,
    content => template("mkscripts/logout.sh.erb"),
    require => File["loginwindow"],
    owner   => root,
    mode    => 700,
  }
  file{$indir:
    ensure  => directory,
    owner   => 'root',
    mode    => 700,
    recurse => true,
    purge   => true,
  }
  file{$outdir:
    ensure  => directory,
    owner   => 'root',
    mode    => 700,
    recurse => true,
    purge   => true,
  }
  file{"loginwindow":
    path    => "/var/root/Library/Preferences/com.apple.loginwindow.plist",
    ensure  => present,
  }
  exec{"loginhook":
    provider    => shell,
    command     => "defaults write com.apple.loginwindow LoginHook ${mgdir}login.sh",
    subscribe   => File["loginwindow"],
    refreshonly => true,
  }
  exec{"logouthook":
    provider    => shell,
    command     => "defaults write com.apple.loginwindow LogoutHook ${mgdir}logout.sh",
    subscribe   => File["loginwindow"],
    refreshonly => true,
  }
}

