#
# Cookbook Name:: test
# Recipe:: package
#
# Copyright 2012-2018 DNSimple Corp
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

apt_update 'apt_updater'

exabgp_install 'default'

exabgp_config 'default'

exabgp_config 'template-vars' do
  config_name 'custom_description'
  cookbook 'test'
  variables(description: 'Custom description')
end

exabgp_service 'default' do
  service_type :runit
  action [:enable, :start]
end

exabgp_service 'custom' do
  service_type :runit
  install_name 'default'
  config_name 'template-vars'
  action [:enable, :start]
end
