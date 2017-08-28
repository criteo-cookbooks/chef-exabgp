property :instance_name, kind_of: String, name_property: true
property :install_type, kind_of: Symbol, equal_to: %i(package source), default: :package
property :cookbook, kind_of: String
property :variables, kind_of: Hash

include ExabgpCookbook::Helpers

action :create do
  case new_resource.install_type
  when :package
    include_recipe 'poise-python'

    python_package 'exabgp' do
      action :install
    end
  when :source
    package 'git-core'

    git '/usr/src/exabgp' do
      repository node['exabgp']['source_url']
      reference node['exabgp']['source_version']
      action :sync
    end

    node.default['exabgp']['bin_path'] = '/usr/src/exabgp/sbin/exabgp'
  end

  directory "/etc/#{installation_name(new_resource.instance_name)}"

  template "/etc/#{installation_name(new_resource.instance_name)}/exabgp.conf" do
    cookbook new_resource.cookbook
    source 'exabgp.conf.erb'
    variables(new_resource.variables)
    mode '0644'
  end

  node.default['exabgp']['config_path'] = "/etc/#{installation_name(new_resource.instance_name)}/exabgp.conf"

  template "/etc/#{installation_name(new_resource.instance_name)}/exabgp.env" do
    cookbook new_resource.cookbook
  end
end
