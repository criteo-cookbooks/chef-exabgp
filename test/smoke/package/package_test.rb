describe processes('/usr/bin/python2.7 /usr/local/bin/exabgp') do
  it { should exist }
end

describe file('/etc/exabgp/exabgp.conf') do
  it { should exist }
end
