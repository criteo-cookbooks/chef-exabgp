require 'spec_helper'

describe 'exabgp_service' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['exabgp_service']).converge('exabgp_service_test::package')
  end

  it 'installs the python package through exabgp_service' do
    expect(chef_run).to install_package('python')
  end
end
