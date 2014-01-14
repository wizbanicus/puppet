class install_app::libreoffice {
  if !$appdmg_installed_libo_3_6_4_macos_x86_install_en_us_dmg {
    install_app { 'LibO_3.6.4_MacOS_x86_install_en-US.dmg':
      my_provider   => appdmg,
      require       => File['remove_old_libreoffice'],
    }
    install_app { 'LibO_3.6.4_MacOS_x86_langpack_en-GB.dmg':
    require => Install_app['LibO_3.6.4_MacOS_x86_install_en-US.dmg'],
    }
    file{ 'remove_old_libreoffice':
      path   => '/Applications/LibreOffice.app',
      ensure => absent,
    }
  }
}

