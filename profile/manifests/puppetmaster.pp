# class profile::puppetmaster
# installs puppetmaster packages
class profile::puppetmaster {
  package{ "puppetmaster":
    ensure => present,
  }
}
