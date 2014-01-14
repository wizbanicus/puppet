class install_app::unity {
  install_app { 'unity-4.2.0.dmg':
  }
  file {'/Applications/Unity/MonoDevelop':
    mode    => 777,
    recurse => true,
    require => Install_app['unity-4.2.0.dmg'],
  }
}