# http://blogs.cae.tntech.edu/mwr/2008/07/12/stupid-puppet-trick-poor-mans-undo/

# Class: memcached::disabled
#
# This class disables memcached
#
# Sample Usage:
#   include memcached
#   include memcached::disabled
class memcached::disabled inherits memcached {
    Package["memcached"] {
        ensure => purged
    }

    File["/etc/memcached.conf"] {
        ensure => absent,
    }

    # python pylibmc memcached client
    Package["libmemcached-dev"] {
        ensure => purged,
    }

    # python module useful for querying memcached stats
    Package["python-memcache"] {
        ensure => purged,
    }

    Service["memcached"] {
        ensure => stopped,
        status => '/etc/init.d/memcached status',
    }
}


# Class: memcached::metrics::disabled
#
# This class disables memcached::metrics
#
# Sample Usage:
#   in order to disable a different $bindir, the memcached::metrics
#   definition must be included along with memcached::metrics::disabled.
#   For example:
#     class { "memcached::metrics": bindir => "/usr/local/sbin" }
#     include memcached::metrics::disabled
class memcached::metrics::disabled inherits memcached::metrics {
    File["${bindir}/memcached_metrics.py"] {
        ensure => absent,
    }

    Cron["memcached_metrics"] {
        ensure => absent,
    }
}
