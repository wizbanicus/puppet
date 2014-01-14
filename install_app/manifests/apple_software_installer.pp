class install_app::apple_software_installer {
  if !$pkgdmg_applesoftwareinstallerupdate_dmg {
    install_app { 'AppleSoftwareInstallerUpdate.dmg': }
  }
}

