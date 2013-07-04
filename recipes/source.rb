include_recipe 'mercurial'

mercurial '/usr/src/exabgp' do
  repository 'https://code.google.com/p/exabgp/'
  action :sync
end

# include_recipe 'exabgp'
