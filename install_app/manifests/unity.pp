class install_app::unity {
  install_app { 'Unity.pkg':
    my_provider => 'pkgdmg',
  }
  file {'/Applications/Unity/MonoDevelop':
    mode    => 777,
    recurse => true,
    require => Install_app['Unity.pkg'],
  }
}
