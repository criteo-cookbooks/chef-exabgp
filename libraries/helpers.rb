module ExabgpCookbook
  module Helpers
    def installation_name(instance_name)
      if instance_name.empty? || instance_name == 'default'
        'exabgp'
      else
        "exabgp-#{instance_name}"
      end
    end
  end
end
