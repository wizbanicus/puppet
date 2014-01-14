class profile::acch_shortcuts {
  shortcuts::linkdirs { ['programming', 'office', 'games', 'video', 'sound', 'animation',
                      '3D Design', 'web design', 'visual design', 'internet']:}

  shortcuts::template_shortcuts { 'Google Chrome.app':
    link_dir   => 'internet',
  }
  shortcuts::template_shortcuts { 'Adobe Photoshop CS6.app':
    app_dir    => 'Adobe Photoshop CS6',
    link_dir   => 'visual design',
  }
  shortcuts::template_shortcuts { 'Adobe Premiere Pro CS6.app':
    app_dir    => 'Adobe Premiere Pro CS6',
    link_dir   => 'video',
  }
  shortcuts::template_shortcuts { 'Adobe After Effects CS6.app':
    app_dir    => 'Adobe After Effects CS6',
    link_dir   => 'video',
  }
  shortcuts::template_shortcuts { 'Adobe Audition CS6.app':
    app_dir    => 'Adobe Audition CS6',
    link_dir   => 'sound',
  }
  shortcuts::template_shortcuts { 'Adobe Illustrator.app':
    app_dir    => 'Adobe Illustrator CS6',
    link_dir   => 'visual design',
  }
  shortcuts::template_shortcuts { 'Adobe Flash CS6.app':
    app_dir    => 'Adobe Flash CS6',
    link_dir   => 'animation',
  }

  shortcuts::template_shortcuts { 'Adobe Encore CS6.app':
    app_dir    => 'Adobe Encore CS6',
    link_dir   => 'video',
  }
  shortcuts::template_shortcuts { 'Adobe Fireworks CS5.app':
    app_dir    => 'Adobe Fireworks CS5',
    link_dir   => 'web design',
  }
  shortcuts::template_shortcuts { '123Dmake.app':
    link_dir   => '3D Design',
  }
  shortcuts::template_shortcuts { 'Adobe Photoshop CS5 alias':
    link_dir   => 'visual design',
    my_ensure  => absent,
  }
  shortcuts::template_shortcuts { 'Adobe Flash CS5 alias':
    link_dir   => 'visual design',
    my_ensure  => absent,
  }
  shortcuts::template_shortcuts { 'Game Maker Lite.app':
    link_dir   => 'programming',
    my_ensure  => present,
  }
  shortcuts::template_shortcuts { 'Adobe Illustrator CS5 alias':
    link_dir   => 'visual design',
    my_ensure  => absent,
  }
  shortcuts::template_shortcuts { 'Adobe Premiere Pro CS5 alias':
    link_dir   => 'video',
    my_ensure  => absent,
  }
  shortcuts::template_shortcuts { 'Unity.app':
    link_dir   => 'programming',
    app_dir    => 'Unity',
  }
}
