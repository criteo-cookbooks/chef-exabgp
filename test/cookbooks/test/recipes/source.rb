apt_update 'test' do
  action :update
end

exabgp 'default' do
  install_type :source
end

runit_service 'exabgp' do
  default_logger true
  options({
    bin_dir: '/usr/src/exabgp/sbin/exabgp',
  }.merge(params))
end
