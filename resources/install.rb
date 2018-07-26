#
# Cookbook Name:: exabgp
# Recipe:: exabgp_install
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

property :install_type, Symbol, equal_to: [:package, :pip, :source], default: :package
property :package_version, String
property :source_install_path, String, default: '/usr/src/exabgp'
property :source_url, String, default: 'https://github.com/Exa-Networks/exabgp.git'
property :source_version, String, default: 'master'
property :bin_path, String, default: '/usr/src/exabgp/sbin/exabgp'

include ExabgpCookbook::Helpers

action :install do
  case new_resource.install_type
  when :package
    package 'exabgp' do
      action :install
      version new_resource.package_version if new_resource.package_version
    end
    new_resource.bin_path = '/usr/sbin/exabgp'
  when :pip
    python_runtime '3'

    user 'exabgp' do
      system true
    end

    python_virtualenv 'exabgp' do
      path '/opt/exabgp'
      user 'exabgp'
    end

    python_package 'exabgp' do
      action :install
      version new_resource.package_version if new_resource.package_version
      virtualenv 'exabgp'
      user 'exabgp'
    end

    new_resource.bin_path = '/opt/exabgp/bin/exabgp'
  when :source
    package 'git-core'

    git new_resource.source_install_path do
      repository new_resource.source_url
      reference new_resource.source_version
      action :sync
    end
  end
end
