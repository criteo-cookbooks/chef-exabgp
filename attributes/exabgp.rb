default[:exabgp][:local_as] = 0
default[:exabgp][:peer_as] = 0
default[:exabgp][:ipv4][:neighbor] = '127.0.0.1'
default[:exabgp][:ipv4][:router_id] = node.ipaddress
default[:exabgp][:ipv4][:local_address] = node.ipaddress
default[:exabgp][:ipv6][:neighbor] = nil
default[:exabgp][:ipv6][:router_id] = nil
default[:exabgp][:ipv6][:local_address] = nil
