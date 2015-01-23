default[:exabgp][:local_as] = 0
default[:exabgp][:peer_as] = 0
default[:exabgp][:community] = [0]

default[:exabgp][:hold_time] = 20

default[:exabgp][:ipv4][:neighbor] = '127.0.0.1'
default[:exabgp][:ipv4][:anycast] = '127.0.0.1'

default[:exabgp][:ipv6][:neighbor] = nil
default[:exabgp][:ipv6][:anycast] = '::1'

default[:exabgp][:source_version] = '3.4.7'
default[:exabgp][:bin_path] = '/usr/local/bin/exabgp'

default[:exabgp][:watchdog_flag_file] = '/tmp/exabgp-announce'
