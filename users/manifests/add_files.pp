# defined type users::add_files
# adds files to a directory recursively remote only.
# Can't be used with the users home or skel directory as this is already a file resource
# 
define users::add_files (
  $dir,
  $src,
)
{
  file {"${dir}":
    ensure  => directory,
    recurse => remote,
    source  => $src,
  }
}
