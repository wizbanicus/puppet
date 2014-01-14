# = Type: shortcuts::linkdirs
#
# This defined type places a directory in the /Applications 
# directory Supported on Mac 10.6
#
# == Parameters:
# $apps:: The apps main directory
# $link_dir:: link directory
# 
#
# == Requires:
# Nothing
# 
# == Sample Usage:
#  shortcuts::linkdirs { 'Sound': }
#
define shortcuts::linkdirs ( $apps='/Applications', $link_dir=$name ) {
  file { $link_dir :
    path      => "${apps}/${link_dir}",
    ensure    => directory,
  }
}
