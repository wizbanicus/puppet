class install_app::jre {
  install_app { 'jre_7u51_macosx_x64.pkg':
    my_provider => 'pkgdmg',
  }
}
