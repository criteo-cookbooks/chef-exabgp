module ExabgpCookbook
  class Exabgp < ChefCompat::Resource
    resource_name :exabgp

    property :install_type, kind_of: Symbol, default: :package

    action :install do
      include_recipe 'poise-python'

      python_package 'exabgp' do
        action :install
      end

      directory "/etc/exabgp-#{name}"
    end
  end
end
