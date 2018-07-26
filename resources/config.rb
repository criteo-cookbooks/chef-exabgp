#
# Cookbook Name:: exabgp
# Resource:: exabgp_config
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

property :config_name, String, default: 'exabgp'
property :config_dir, String, default: '/etc/exabgp'
property :config_path, String
property :cookbook, String, default: 'exabgp'
property :variables, Hash

action :create do
  unless new_resource.config_path
    new_resource.config_path = exabgp_config_path(config_path: new_resource.config_dir,
                                                  config_name: new_resource.config_name)
  end

  directory new_resource.config_dir

  template new_resource.config_path do
    owner 'exabgp'
    group 'exabgp'
    cookbook new_resource.cookbook
    source 'exabgp.conf.erb'
    variables(new_resource.variables)
    mode '0644'
  end
end

action_class do
  include ExabgpCookbook::Helpers
end
