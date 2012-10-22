#
# Cookbook Name:: exabgp
# Recipe:: default
#
# Copyright 2012, DNSimple, Inc.
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

package 'exabgp'

template 'exabgp: default' do
  path '/etc/default/exabgp'
  source 'default.erb'
  mode '644'
  notifies :restart, 'service[exabgp]'
end

template 'exabgp: config' do
  path '/etc/exabgp/exabgp.conf'
  source 'exabgp.conf.erb'
  notifies :reload, 'service[exabgp]'
end

service 'exabgp' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
