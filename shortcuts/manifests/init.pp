# = Type: shortcuts
#
# This defined type places a shortcut (symbolic link) in the appropriate 
# directory Supported on Mac 10.6
#
# == Parameters:
# $apps:: The apps main directory
# $link_dir:: where the links are kept
# $app_dir:: main app directory (only supports on level of depth)
# $link_file:: the actual name of the file (the link and file are doubled up)
# $my_ensure:: defaults to link, but could be absent in case you want to drop a link!
# 
#
# == Requires:
# Nothing
# 
# == Sample Usage:
#  shortcuts { 'Adobe Premiere Pro CS6.app':
#    app_dir    => 'Adobe Premiere Pro CS6',
#    link_dir   => 'video',
#  }
#
define shortcuts ( $apps='/Applications', $link_dir, $app_dir='', $link_file=$title, $my_ensure='link' ) {
  file { $link_file :
    target    => "${apps}/${app_dir}/${link_file}",
    path      => "${apps}/${link_dir}/${link_file}",
    ensure    => $my_ensure,
  }
}
