require 'spec_helper'

describe 'exabgp' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['exabgp']).converge('exabgp_test::default')
  end

  context 'defaults' do
    it 'calls the exabgp resource with the name package' do
      expect(chef_run).to install_exabgp('default')
    end

    it 'installs the exabgp package through python pip' do
      expect(chef_run).to install_python_package('exabgp')
    end

    it 'creates a configuration directory with the installation name attached' do
      expect(chef_run).to create_directory('/etc/exabgp-default')
    end

    it 'creates a default template in the config directory' do
      expect(chef_run).to create_template('/etc/exabgp-default/exabgp.conf')
    end
  end

  context 'no instance name' do
    it 'calls the exabgp resource with the name false_instance' do
      expect(chef_run).to install_exabgp('false_instance')
    end

    it 'installs the exabgp package through python pip' do
      expect(chef_run).to install_python_package('exabgp')
    end

    it 'creates a configuration directory without the installation name attached' do
      expect(chef_run).to create_directory('/etc/exabgp')
    end

    it 'creates a default template in the config directory' do
      expect(chef_run).to create_template('/etc/exabgp/exabgp.conf')
    end
  end

  context 'custom instance name' do
    it 'calls the exabgp resource with the name false_instance' do
      expect(chef_run).to install_exabgp('instance')
    end

    it 'installs the exabgp package through python pip' do
      expect(chef_run).to install_python_package('exabgp')
    end

    it 'creates a configuration directory with the instance name attached' do
      expect(chef_run).to create_directory('/etc/exabgp-anycast')
    end

    it 'creates a default template in the config directory' do
      expect(chef_run).to create_template('/etc/exabgp-anycast/exabgp.conf')
    end
  end
end
