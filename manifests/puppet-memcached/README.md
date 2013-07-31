# puppet-memcached

This class manages memcached via Puppet.  It is Ubuntu specific.

## Sample Usage

```
class { "memcached":
  listen => "0.0.0.0",
  maxmem => 1024,
}
```

## Parameters:

 * $listen: ip address to bind to
 * $port: port to run memcached process on
 * $maxmem: maximum amount of RAM (in MB) that memcached process will use
