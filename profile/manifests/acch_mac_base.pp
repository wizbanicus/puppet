class profile::acch_mac_base {
  include install_app::chrome
#  include install_app::unity
  include install_app::scratch
#  class {'flash_plugin':
#    auto_update_disable       => 0,
#    silent_auto_update_enable => 1,
#    auto_update_interval      => 0,
#  }
  include install_app::itunes
  include install_app::ricoh_driver
#  include install_app::adobe_prodprm_cs6
#  include install_app::adobe_pp_extras
  include install_app::libreoffice
  include install_app::123dmake
  include install_app::packages
  include install_app::vlc
  include install_app::firefox
}
