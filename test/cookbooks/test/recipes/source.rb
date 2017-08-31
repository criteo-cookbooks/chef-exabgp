apt_update 'test' do
  action :update
end

exabgp 'default' do
  install_type :source
end
