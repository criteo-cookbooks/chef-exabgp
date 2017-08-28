module ExabgpCookbook
  module Helpers
    def installation_name
      if new_resource.instance_name.empty? || new_resource.instance_name == 'default'
        'exabgp'
      else
        "exabgp-#{new_resource.instance_name}"
      end
    end
  end
end
