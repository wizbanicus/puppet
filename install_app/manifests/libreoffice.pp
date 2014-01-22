class install_app::libreoffice {
  if !$appdmg_installed_libo_4_1_4_macos_x86_dmg {
    install_app { 'LibreOffice_4.1.4_MacOS_x86.dmg':
      my_provider   => appdmg,
      require       => File['remove_old_libreoffice'],
    }
    install_app { 'LibreOffice_4.1.4_MacOS_x86_langpack_en-GB.dmg':
    require => Install_app['LibreOffice_4.1.4_MacOS_x86.dmg'],
    }
    file{ 'remove_old_libreoffice':
      path   => '/Applications/LibreOffice.app',
      ensure => absent,
    }
  }
}

