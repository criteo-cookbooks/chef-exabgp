describe pip('exabgp') do
  it { should be_installed }
end

describe file('/etc/exabgp/exabgp.conf') do
  it { should exist }
end

describe file('/etc/exabgp-anycast/exabgp.conf') do
  it { should exist }
end

describe file('/etc/exabgp-template-vars/exabgp.conf') do
  it { should exist }
  its('content') { should include 'A test' }
end
