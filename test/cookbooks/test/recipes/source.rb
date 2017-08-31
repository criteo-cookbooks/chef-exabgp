apt_update 'test' do
  action :update
end

exabgp 'default' do
  install_type :source
end

poise_service 'exabgp' do
  provider :runit
  command '/usr/src/exabgp/sbin/exabgp /etc/exabgp/exabgp.conf'
  reload_signal 'USR1'
end
