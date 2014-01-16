# defined type users::skel
# creates a template directory to refresh a user account from.
# in this way we can have a custom account that is refreshed each logout
# along with potential backups of certain user files.
# the initial template is created from the system template user.
define users::skel (
  $skel,
  $newskel = $name,
)
{
  file {"${newskel}":
    ensure  => directory,
    recurse => remote,
    source  => $skel,
  }
}

