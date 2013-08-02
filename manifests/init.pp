class { 'apt':
always_apt_update    => true
}

class { "memcached":
  listen => "0.0.0.0",
  maxmem => 1024,
}
