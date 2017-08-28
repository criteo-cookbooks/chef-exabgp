apt_update 'test' do
  action :update
end

exabgp_install 'default' do
  install_type :package
end

poise_service 'exabgp' do
  provider :runit
  command 'exabgp /etc/exabgp/exabgp.conf'
  reload_signal 'USR1'
end
