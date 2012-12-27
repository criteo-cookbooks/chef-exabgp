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

include_recipe 'python'
include_recipe 'runit'

python_pip 'exabgp' do
  action :install
end

template 'exabgp: config' do
  path '/etc/exabgp/exabgp.conf'
  source 'exabgp.conf.erb'
  variables( :neighbor => node[:exabgp][:neighbor],
             :router_id => node[:exabgp][:router_id],
             :local_address => node[:exabgp][:local_address],
             :local_as => node[:exabgp][:local_as],
             :peer_as => node[:exabgp][:peer_as],
             :anycast_ip => node[:exabgp][:anycast_ip] )
  mode '644'
end

runit_service 'exabgp'
