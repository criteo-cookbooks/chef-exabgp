module ExabgpCookbook
  class Exabgp < ChefCompat::Resource
    resource_name :exabgp

    property :instance, kind_of: [String, FalseClass], name_property: true
    property :install_type, kind_of: Symbol, default: :package

    action :install do
      include_recipe 'poise-python'

      python_package 'exabgp' do
        action :install
      end

      directory "/etc/#{installation_name}"

      template "/etc/#{installation_name}/exabgp.conf" do
        source 'exabgp.conf.erb'
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
