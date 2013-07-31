# Class: memcached
#
# This class manages memcached
#
# Parameters:
# - $listen: ip address to bind to
# - $port: port to run memcached process on
# - $maxmem: maximum amount of RAM that memcached process will use
#
# Sample Usage:
#  include memcached
#
class memcached(
  $listen = $memcached::params::listen,
  $port   = $memcached::params::port,
  $maxmem = $memcached::params::maxmem
) inherits memcached::params {

  include ntp

  package { "memcached":
      ensure => installed,
  }

  file { "/etc/memcached.conf":
    ensure => present,
    owner => root,
    group => root,
    mode => "0644",
    content => template("memcached/memcached.conf.erb"),
  }

  service { "memcached":
      require => [
        Class["ntp"],
        Package["memcached"],
      ],
      ensure => running,
      subscribe => File["/etc/memcached.conf"],
  }

  # needed for python pylibmc memcached client
  package { "libmemcached-dev":
    ensure => installed,
  }

  # python module useful for querying memcached stats
  package { "python-memcache":
    ensure => installed,
  }
}
