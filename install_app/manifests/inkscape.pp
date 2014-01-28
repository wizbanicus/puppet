# class install_app::inkscape
# inkscape
class install_app::inkscape {
  install_app { 'Inkscape-0.48.2-1-SNOWLEOPARD.dmg':
    my_provider => appdmg,
  }
}


