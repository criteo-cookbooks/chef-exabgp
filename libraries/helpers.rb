module ExabgpCookbook
  module Helpers
    def installation_name(instance_name)
      if instance_name
        "exabgp-#{instance_name}"
      else
        'exabgp'
      end
    end

    def exabgp_instance_name(config_name = 'exabgp')
      if config_name == 'exabgp'
        'exabgp'
      else
        "exabgp-#{config_name}"
      end
    end

    def exabgp_config_path(config_path: '/etc/exabgp', config_name: 'exabgp')
      if config_name == 'exabgp'
        "#{config_path}/exabgp.conf"
      else
        "#{config_path}/exabgp-#{config_name}.conf"
      end
    end

    def install_resource
      if new_resource.install_name
        find_resource(:exabgp_install, new_resource.install_name)
      else
        find_resource(:exabgp_install, 'default')
      end
    end

    def config_resource
      if new_resource.config_name
        find_resource(:exabgp_config, new_resource.config_name)
      else
        find_resource(:exabgp_config, 'default')
      end
    end

    def service_name
      exabgp_instance_name(config_resource.config_name)
    end
  end
end
