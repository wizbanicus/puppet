class install_app::libreoffice {
  if !$appdmg_installed_libreoffice_4_1_4_macos_x86_dmg {
    install_app { 'LibreOffice_4.1.4_MacOS_x86.dmg':
      my_provider   => appdmg,
    }
    install_app { 'LibreOffice_4.1.4_MacOS_x86_langpack_en-GB.dmg':
    require => Install_app['LibreOffice_4.1.4_MacOS_x86.dmg'],
    }
  }
}

