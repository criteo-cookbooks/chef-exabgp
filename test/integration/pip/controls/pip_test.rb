describe pip('exabgp', '/opt/exabgp/bin/pip') do
  it { should be_installed }
end

describe file('/etc/exabgp/exabgp.conf') do
  it { should exist }
end

describe file('/etc/exabgp/exabgp-custom_description.conf') do
  it { should exist }
  its('content') { should include 'Custom description' }
end
