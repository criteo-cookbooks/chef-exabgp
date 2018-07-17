# exabgp cookbook

Installs and configures [ExaBGP](https://github.com/Exa-Networks/exabgp)
the swiss-army knife of networking.

## DEPRECATION NOTICE and Migration to Chef 13.10+

The 3.x series is the last of Chef 12 compatible releases and will now provide
ample warnings in your logs. The 4.x release will be Chef 13.8+ compatible and
feature partially re-written and updated install and config resource for better
maintainability. The 5.x series will remove the exabgp resource along with the
attributes in this cookbook.

To migrate your current resource over to the 4.x series, you'll need to do a few things:

* Upgrade to Chef 13.10 or higher
* Rename any instance of `exabgp` to `exabgp_install`
* Set the `package_version` in your `exabgp_install` resource. Cookbook attributes
  will be eliminated in the future release
* Migrate any cookbook attributes you have set to their relevant properties in
  the new `exabgp_install` or `exabgp_config` resource, this includes:
    * `package_version`
    * `source_url`
    * `source_version`
* In each of those instances, if you have the `instance` property set, rename
  it to `instance_name` in the `exabgp_config` resource

## Supported Chef and Platforms

* Chef 12.6 and newer

* Ubuntu 14.04 and newer

## Dependencies

* poise-python (for package installation)
* git (for source installation)

## Attributes

| Attribute | Description | Default Value |
| --- | --- | --- |
| `node['exabgp']['package_version']` | Version of the python package to install | `3.4.19` |
| `node['exabgp']['bin_path']` | Location of the ExaBGP binary, only set on source installations | `/usr/sec/exabgp/sbin/exabgp` |
| `node['exabgp']['config_path']` | Location of the ExaBGP configuration file, only set when a resource with instance set to false is configured | `/etc/exabgp/exabgp.conf` |
| `node['exabgp']['source_url']` | URL to the git repository for source installtions | `https://github.com/Exa-Networks/exabgp.git` |
| `node['exabgp']['source_version']` | git ref of the version to install | `master` |

## Recipes

* `exabgp::default` - Intentionally left blank, see resource usage below

## Resources

### `exabgp`

The `exabgp` resource installs and configures ExaBGP. It _does not_ create
an ExaBGP service. You will need to handle this separately via your service
resource of choice. If you want an example of such a service setup, look at
the `test/cookbooks` folder for some example recipes.

#### Actions

* `:install` – Install and configure ExaBGP. *(default)*

#### Parameters

* `instance` – Name of the ExaBGP installation. If different than the name parameter of the resource. If it is set to false, it will not use the name parameter when naming the instance. This is for backward compatibility with the older version of this cookbook where you may be running an install from `/etc/exabgp`.
* `package_version` – Which version of the python package to install, defaults to the `node['exabgp']['package_version']` attribute.
* `cookbook` – Which cookbook to look for the exabgp.conf.erb template
* `variables` – Pass template variables in much like a template resource
* `install_type` – Supports three type :package (distribution package), :pip (python package) and :source installations. Defaults to :package . If you'd like to support more installation options, send in a pull request. :heart:

#### Examples

```ruby
# Installs into /etc/exabgp-anycast
exabgp 'anycast'

# Backward compatible with the previous exabgp cookbook
# Installs to /etc/exabgp
exabgp 'anycast' do
  instance false
end

# Use your own template from templates/default/exabgp.conf.erb
exabgp 'anycast' do
  cookbook 'mycorp-exabgp'
end

# Setup a service
service 'exabgp'
```

## License and Authors

* Author:: [Aaron Kalin](https://github.com/martinisoft)
* Author:: [Jacobo Garcia](https://github.com/therobot)
* Author:: [Joseph Caudle](https://github.com/jcaudle)

Copyright:: 2013-2018 DNSimple Corp.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
