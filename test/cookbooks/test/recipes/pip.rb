#
# Cookbook Name:: exabgp_service_test
# Recipe:: default
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
apt_update 'test' do
  action :update
end

exabgp 'default'

exabgp 'false_instance' do
  instance false
end

exabgp 'instance' do
  instance 'anycast'
end

exabgp 'template' do
  cookbook 'test'
end

exabgp 'template-vars' do
  cookbook 'test'
  variables(description: 'A test')
end

include_recipe 'runit'

runit_service 'exabgp' do
  default_logger true
  options({
    bin_dir: '/usr/local/bin/exabgp',
  }.merge(params))
end
