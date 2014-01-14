# defined type ::mkscripts::for_users
# login and out script folders for each user declared
# another type will be used to fill these directories with the scripts required.
#
define mkscripts::for_users( $user=$title, $indir, $outdir ){
  file{"${indir}${user}":
    ensure => directory,
    owner  => 'root',
    mode   => 700,
  }
  file{"${outdir}${user}":
    ensure => directory,
    owner  => 'root',
    mode   => 700,
  }
}

