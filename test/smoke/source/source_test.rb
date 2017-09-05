describe directory('/usr/src/exabgp') do
  it { should exist }
end

describe file('/etc/exabgp-default/exabgp.conf') do
  it { should exist }
end
