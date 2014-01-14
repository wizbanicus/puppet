class install_app::game_maker {
    install_app { 'game_maker':
      name => 'Game_Maker_lite.dmg',
      my_provider => appdmg,
  }
}

