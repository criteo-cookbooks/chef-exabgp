module ExabgpCookbook
  module Helpers
    def installation_name(instance_name)
      if instance_name
        "exabgp-#{instance_name}"
      else
        'exabgp'
      end
    end
  end
end
