class install_app::jre {
  if !$::utpkg_installed_jre_7u51_macosx_x64_pkg {
    install_app { 'jre_7u51_macosx_x64.pkg':
      my_provider => 'utpkg',
    }
  }
}
