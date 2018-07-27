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
property :run_location, String, default: '/var/run/exabgp'
property :install_name, String
property :config_name, String

action :enable do
  control_service(:enable)
end

action :start do
  control_service(:start)
end

action_class do
  include ExabgpCookbook::Helpers

  def pid_location
    "#{new_resource.run_location}/#{service_name}.pid"
  end

  def control_service(service_action)
    find_resource(:template, "/etc/init.d/#{service_name}") do
      source 'sysvinit.sh.erb'
      owner 'root'
      group node['root_group']
      mode '0755'
      cookbook 'exabgp'
      variables(
        name: service_name,
        platform_family: node['platform_family'],
        pid_file: pid_location,
        user: 'exabgp',
        daemon: install_resource.bin_path,
        config_path: config_resource.config_path,
        command: "#{install_resource.bin_path} #{config_resource.config_path}",
        directory: '/etc/exabgp'
      )
      action :create
    end

    find_resource(:directory, new_resource.run_location) do
      owner 'exabgp'
      group 'exabgp'
      action :create
    end

    edit_resource(:service, service_name) do
      case node['platform_family']
      when 'debian'
        provider Chef::Provider::Service::Debian
      when 'rhel', 'amazon'
        provider Chef::Provider::Service::Redhat
      else
        provider Chef::Provider::Service::Init
      end
      supports restart: true, reload: true
      action service_action
    end
  end
end
