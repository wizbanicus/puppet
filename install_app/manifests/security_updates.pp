class install_app::security_updates {
  if !$pkgdmg_installed_secupd2013_002_dmg {
    install_app { 'SecUpd2013-002.dmg': }
  }
}

