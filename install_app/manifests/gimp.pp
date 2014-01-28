# class install_app::gimp
# installs gimp via appdmg provider
#
class install_app::gimp {
  install_app {'Gimp-2.8.10.dmg':
    my_provider => appdmg,
  }
}
