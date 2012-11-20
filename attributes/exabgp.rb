default[:exabgp][:neighbor] = '127.0.0.1'
default[:exabgp][:local_as] = 0
default[:exabgp][:peer_as] = 0
default[:exabgp][:router_id] = node.ipaddress
default[:exabgp][:local_address] = node.ipaddress
