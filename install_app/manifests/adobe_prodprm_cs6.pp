class install_app::adobe_prodprm_cs6 {
  install_app { 'CS6_pp_mac_install.pkg':
  }
  file { '/Library/Preferences/com.apple.audio.AggregateDevices.plist':
    source => "puppet:///modules/install_app/com.apple.audio.AggregateDevices.plist",
    ensure => file,
    owner  => administrator,
    group  => admin,
    mode   => 660,
  }
  file { '/Applications/Adobe Photoshop CS6/Presets/Brushes/clubhouse_brushes':
    require => Install_app['CS6_pp_mac_install.pkg'],
    ensure  => directory,
    owner   => "administrator",
    mode    => 775,
    recurse => true,
    source  => '/installers/brushes',
  }
}
