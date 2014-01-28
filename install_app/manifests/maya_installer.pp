# class install_app::maya_installer
# installs the Maya installer - then each machine needs a license!
# yay! for Proprietary software lol
#
class install_app::maya_installer {
  install_app { 'Autodesk_Maya_2014_MAC_OSX.dmg':
    my_provider => 'appdmg',
  }
}
