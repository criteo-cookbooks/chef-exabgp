module ExabgpCookbook
  module Helpers
    def installation_name(instance_name)
      if instance_name
        "exabgp-#{instance_name}"
      else
        'exabgp'
      end
    end

    def exabgp_instance_name(config_name: 'exabgp')
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
  end
end
