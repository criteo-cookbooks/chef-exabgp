require 'spec_helper'

describe 'exabgp_install' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['exabgp_install']).converge('exabgp_test::default')
  end

  context 'defaults' do
    it 'calls the exabgp resource with the name package' do
      expect(chef_run).to create_exabgp_install('default')
    end

    it 'installs the exabgp package through python pip' do
      expect(chef_run).to install_python_package('exabgp')
    end

    it 'creates a configuration directory with the installation name attached' do
      expect(chef_run).to create_directory('/etc/exabgp')
    end

    it 'creates a default template in the config directory' do
      expect(chef_run).to create_template('/etc/exabgp/exabgp.conf')
    end
  end

  context 'custom instance name' do
    it 'calls the exabgp resource with the name anycast_instance' do
      expect(chef_run).to create_exabgp_install('anycast_instance')
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

  context 'custom template' do
    it 'calls the exabgp resource with the name template' do
      expect(chef_run).to create_exabgp_install('template')
    end

    it 'installs the exabgp package through python pip' do
      expect(chef_run).to install_python_package('exabgp')
    end

    it 'creates a configuration directory with the instance name attached' do
      expect(chef_run).to create_directory('/etc/exabgp-template')
    end

    it 'creates a default template in the config directory from the test cookbook' do
      expect(chef_run).to create_template('/etc/exabgp-template/exabgp.conf')
        .with(cookbook: 'exabgp-test')
    end
  end

  context 'custom template variables' do
    it 'calls the exabgp resource with the name template-vars' do
      expect(chef_run).to create_exabgp_install('template-vars')
    end

    it 'installs the exabgp package through python pip' do
      expect(chef_run).to install_python_package('exabgp')
    end

    it 'creates a configuration directory with the instance name attached' do
      expect(chef_run).to create_directory('/etc/exabgp-template-vars')
    end

    it 'creates a default template in the config directory' do
      expect(chef_run).to create_template('/etc/exabgp-template-vars/exabgp.conf')
        .with(
          cookbook: 'exabgp-test',
          variables: { description: 'A test' }
        )
    end
  end
end
