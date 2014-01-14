class install_app::itunes {
  if !$pkgdmg_installed_itunes11_0_4_dmg {
    install_app { 'iTunes11.0.4.dmg': }
  }
}

