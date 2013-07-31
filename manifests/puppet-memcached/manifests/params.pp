# Class: memcached::params
#
# This class manages memcached parameters
#
# Parameters:
# - $listen: ip address to bind to
# - $port: port to run memcached process on
# - $maxmem: maximum amount of RAM that memcached process will use
# - $bindir: directory for metrics scripts
#
class memcached::params {
  # The default is to listen on localhost only. This parameter is one of
  # the only security measures that memcached has, so make sure it's
  # listening on a firewalled interface.
  $listen="127.0.0.1"
  $port="11211"

  # maximum amount of RAM that memcached process will use
  $maxmem="64"

  # directory for metrics scripts
  $bindir="/usr/local/bin"
}
