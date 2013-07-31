exec { "apt-get update":
  path => "/usr/bin",
}

package { ['memcached'] :
    ensure  => 'installed',
    require => Exec['apt-get update'],
}