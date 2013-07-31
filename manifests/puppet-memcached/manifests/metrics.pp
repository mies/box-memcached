# Class: memcached::metrics
#
# This class manages metrics gathering scripts for memcached.
#
# Parameters:
# - $bindir: directory for metrics scripts
#
# Dependencies:
# - gstat class
#
# Sample Usage:
#  Use the same $bindir directory for both gstat and memcached::metrics
#    class { gstat:
#      graphite_host => "graphite.host",
#      bindir => "/usr/local/bin"
#    }
#    include memcached::metrics
#
class memcached::metrics(
  $bindir = $memcached::params::bindir
) inherits memcached::params {
  file { "${bindir}/memcached_metrics.py":
    ensure => present,
    owner => root,
    group => root,
    mode => "0755",
    content => template("memcached/memcached_metrics.py.erb"),
    require => Service["memcached"]
  }

  cron { "memcached_metrics":
    ensure => present,
    command => "${bindir}/memcached_metrics.py",
    user => root,
    minute => "*/10",
    require => File["${bindir}/memcached_metrics.py"]
  }
}
