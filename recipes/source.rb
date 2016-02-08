package 'git-core'

git '/usr/src/exabgp' do
  repository node['exabgp']['source_url']
  reference node['exabgp']['source_version']
  action :sync
end

node.set['exabgp']['bin_path'] = '/usr/src/exabgp/sbin/exabgp'

include_recipe 'exabgp::default'
