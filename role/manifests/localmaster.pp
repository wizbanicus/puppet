# class role::localmaster
# deploys modules to another puppet server
# also deploys a site.pp to that server using a template.
# the site.pp will include directives to install various modules 
# to various hosts.
# We are using the deploy::mods type to select the modules we wish to 
# deploy to the server
# and a template to generate the site.pp.
# this module will take all the parameters (including arrays) that
# are required by the template to build site.pp
# It will also edit puppet.conf to add its servername
# ultimately our site.pp.erb will generate hostnames from an array with the 
# group name as a comment at the top. the hosts in the group will be assigned 
# the same role, and send params to it.
class role::localmaster (
$servername,
$modz = [],
$sitesetup = [],
$mstrsslbasedir = '/var/lib/puppet/master', 
$mstrssldir     = '/var/lib/puppet/master/ssl', 
$agntsslbasedir = '/var/lib/puppet/',
$agntssldir     = '/var/lib/puppet/ssl', 
$sitemanaged    = false,
) {
  ::deploy::mods { $modz: }
  if $sitemanaged {
    file { '/etc/puppet/manifests/site.pp':
      ensure   => present,
      content  => template("role/localmaster/site.pp.erb"),     
    }
  }
  augeas { "setmaster":
    context => "/files/etc/puppet/puppet.conf",
    changes => [ "set master/certname $servername",
	         "rm main/ssldir",
		 "set master/ssldir $mstrssldir",
		 "set agent/ssldir $agntssldir" ],
    require => [ File["$mstrssldir"], File["$agntssldir"] ],
  }
  file { ["$agntsslbasedir", "$agntssldir", "$mstrsslbasedir", "$mstrssldir" ] :
    ensure => directory,
  }
  class { '::profile::puppetmaster': 
    require => Augeas["setmaster"],
  }
}
