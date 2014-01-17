# Defined type - Install apps
# takes the sourse dir parameter and the name of the application to be installed,
# installs it on the machine
# set the default directories and providers at the top
# take $source_dir and $my_provider parameters
#
### NOTE: The setting of $provider_real and $src_dir_real SEEMS whacky!! 
# There may be a better / clearer way to do this!
# if we don't pass the parameter its false so we set it to the default (set above)
# if we DO pass the parameter, its not false so it "defaults" to the value we passed ;-)
# 
#
define install_app($src_dir = false, $my_provider = false, $uninstall_old = false, $old_path = false, $my_touch_file = false) { 
  case $operatingsystem {
    Darwin: {
      $default_src_dir = '/installers/macos'
      $default_provider = 'pkgdmg'
    }
    windows: {
      $default_src_dir = '/mnt/installers/win7'
      $default_provider = 'windows'
    }
    ubuntu: {
      $default_src_dir = '/mnt/installers/ubuntu'
      $default_provider = 'apt'
    }
  }

  $src_dir_real = $src_dir ? {
    false   => $default_src_dir,
    default => $src_dir,
  }
  $provider_real = $my_provider ? {
    false   => $default_provider,        
    default => $my_provider,
  }

  if $provider_real == 'utpkg' {
    notify{ "careful the package ${name} must be a .pkg file!": }
    exec { "utpkg_${name}": 
      command => "/usr/sbin/installer -allowUntrusted -pkg ${src_dir_real}/${name} -target / ;", 
    } 
    file { "/var/db/.puppet_utpkg_installed_${name}":
      ensure   => file,
      require  => Exec["utpkg_${name}"],
    }
  }
  else {
    package { $name:
      ensure   => installed,
      provider => $provider_real,
      source   => "${src_dir_real}/${name}",
    }
  }
}


