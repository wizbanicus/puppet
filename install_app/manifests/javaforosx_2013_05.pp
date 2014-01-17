class install_app::javaforosx_2013_05 {
  if !$::utpkg_installed_javaforosx_2013_05_pkg {
    install_app { 'javaforosx_2013_05.pkg':
      my_provider => 'utpkg',
    }
  }
}
