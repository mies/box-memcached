exec { "apt-get update":
  path => "/usr/bin",
}

class { "memcached":
  listen => "0.0.0.0",
  maxmem => 1024,
}
