class install_app::itunes {
  if !$pkgdmg_installed_itunes11_1_3_dmg {
    install_app { 'iTunes11.1.3.dmg': }
  }
}

