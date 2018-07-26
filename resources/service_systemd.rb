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

provides :exabgp_service, os: 'linux' do |node|
  node['init_package'] == 'systemd'
end

property :service_type, Symbol, equal_to: [:runit, :systemd]
property :bin_location, String, default: '/usr/sbin/exabgp'
property :install_name, String
property :config_name, String
property :cookbook, String, default: 'exabgp'
property :variables, Hash

action :enable do
  install_resource = if new_resource.install_name
                       find_resource(:exabgp_install, new_resource.install_name)
                     else
                       find_resource(:exabgp_install, 'default')
                     end

  config_resource = if new_resource.config_name
                      find_resource(:exabgp_config, new_resource.config_name)
                    else
                      find_resource(:exabgp_config, 'default')
                    end

  service_name = exabgp_instance_name(config_resource.config_name)

  systemd_unit "#{service_name}.service" do
    content(
      Unit: {
        Description: 'ExaBGP',
        Documentation: 'https://github.com/Exa-Networks/exabgp/wiki',
        After: 'network.target',
        ConditionPathExists: config_resource.config_path,
      },
      Service: {
        Environment: 'exabgp_daemon_daemonize=false',
        ExecStart: "#{install_resource.bin_path} #{config_resource.config_path}",
        ExecReload: '/bin/kill -USR1 $MAINPID',
        SuccessExitStatus: '0 1',
      },
      Install: {
        WantedBy: 'multi-user.target',
      }
    )
    verify false
    action [:create, :enable]
  end
end

action :start do
end

action_class do
  include ExabgpCookbook::Helpers
end
