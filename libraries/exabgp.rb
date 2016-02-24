module ExabgpCookbook
  class Exabgp < ChefCompat::Resource
    resource_name :exabgp

    property :instance, kind_of: [String, FalseClass], name_property: true
    property :install_type, kind_of: Symbol, default: :package
    property :cookbook, kind_of: String
    property :variables, kind_of: Hash

    action :install do
      case install_type
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

      directory "/etc/#{installation_name}"

      template "/etc/#{installation_name}/exabgp.conf" do
        cookbook new_resource.cookbook
        source 'exabgp.conf.erb'
        variables(new_resource.variables)
        mode 0644
      end
    end

    protected

    def installation_name
      if instance
        "exabgp-#{instance}"
      else
        'exabgp'
      end
    end
  end
end
