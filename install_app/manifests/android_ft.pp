# class install_app:android_ft
# enables ease transfer of files from android to mac
#
class install_app::android_ft {
  install_app { 'androidfiletransfer.dmg':
    my_provider => appdmg,
  }
}
