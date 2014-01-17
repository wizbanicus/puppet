class install_app::unity {
  if !$::utpkg_installed_unity_pkg {
    install_app { 'Unity.pkg':
      my_provider => 'utpkg',
    }
    file {'/Applications/Unity/MonoDevelop':
      mode    => 777,
      recurse => true,
      require => Install_app['Unity.pkg'],
    }
  }
}
