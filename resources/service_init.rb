#
# Cookbook Name:: exabgp
# Resource:: exabgp_service
#
# Copyright 2012-2018, DNSimple Corp.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

provides :exabgp_service do |node|
  node['init_package'] == 'init' || node['init_package'] == 'upstart'
end

property :bin_location, String, default: '/usr/sbin/exabgp'
property :install_name, String
property :config_name, String

action :enable do
  service_name = exabgp_instance_name(config_resource.config_name)

  template "/etc/init.d/#{service_name}" do
    source 'sysvinit.sh.erb'
    owner 'root'
    group node['root_group']
    mode '0755'
    cookbook 'exabgp'
    variables(
      name: service_name,
      platform_family: node['platform_family'],
      pid_file: "/var/run/exabgp/#{service_name}",
      user: 'exabgp',
      daemon: install_resource.bin_path,
      directory: '/etc/exabgp'
    )
  end

  service service_name do
    case node['platform_family']
    when 'debian'
      provider Chef::Provider::Service::Debian
    when 'rhel', 'amazon'
      provider Chef::Provider::Service::Redhat
    else
      provider Chef::Provider::Service::Init
    end
    supports restart: true, reload: true
    action :enable
  end
end

action :start do
end

action_class do
  include ExabgpCookbook::Helpers
end
