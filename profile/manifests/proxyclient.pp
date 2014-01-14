# class profle::proxy client.
# puts in required settings for host to be a proxy client.
# 
class profile::proxyclient (
  $proxyserver,
) {
  $protocols = [ "http", "https", "ftp" ] 
  case $::operatingsystem {
    'Ubuntu': {
      if $proxyserver  {
        $augset = "set"
	$proxyserver_real = $proxyserver
        $ensure_proxy = 'present'
      }
      else {
	$augset = "rm"
	$proxyserver_real = ''
	$ensure_proxy = 'absent'
      }
      augeas{"set_proxy":
        context  => "/files/etc/environment",
        changes  => ["$augset http_proxy $proxyserver_real",
                     "$augset https_proxy $proxyserver_real",
		     "$augset ftp_proxy $proxyserver_real",
                     "$augset HTTP_PROXY $proxyserver_real",
                     "$augset HTTPS_PROXY $proxyserver_real",
		     "$augset FTP_PROXY $proxyserver_real" ],
      }      
      file{'/etc/apt/apt.conf.d/95proxies':
        content  => template("profile/proxyclient/95proxies.erb"),
	ensure   => $ensure_proxy,
      }	
    }
    Default: {
      notice {"this operating system does not support this class $name":}
    }
  }
}
