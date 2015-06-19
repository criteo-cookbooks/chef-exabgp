def route(version = 'ipv4')
  anycast_ip = node['exabgp'][version]['anycast']
  return anycast_ip.kind_of?(String) ? [anycast_ip] : anycast_ip
end
