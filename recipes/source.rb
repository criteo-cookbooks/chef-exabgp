package 'git-core'

git '/usr/src/exabgp' do
  repository 'https://github.com/Exa-Networks/exabgp.git'
  reference node['exabgp']['source_version']
  action :sync
end

node.set['exabgp']['bin_path'] = '/usr/src/exabgp/sbin/exabgp'

include_recipe 'exabgp::default'
