# Class run_puppet
# sets cron to run puppet nightly
class run_puppet {
$min = fqdn_rand(60)
  cron{ 'puppet_run':
    command => 'puppet agent --test',
    user    => root,
    hour    => 1,
    minute  => $min,
  }
}
