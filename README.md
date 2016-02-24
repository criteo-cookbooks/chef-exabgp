# exabgp cookbook

Installs and configures [ExaBGP](https://github.com/Exa-Networks/exabgp)
the swiss-army knife of networking.

## Supported Chef and Platforms

* Chef 12.1 and newer

* Ubuntu 12.04
* Ubuntu 14.04

## Dependencies

* poise-python (for package installation)
* git (for source installation)

## Attributes

| Attribute | Description | Default Value |
| --- | --- | --- |
| `node['exabgp']['bin_path']` | Location of the ExaBGP binary, only set on source installations | `/usr/sec/exabgp/sbin/exabgp` |
| `node['exabgp']['config_path']` | Location of the ExaBGP configuration file | `/etc/exabgp/exabgp.conf` |
| `node['exabgp']['source_url']` | URL to the git repository for source installtions | `https://github.com/Exa-Networks/exabgp.git` |
| `node['exabgp']['source_version']` | git ref of the version to install | `master` |

## Recipes

* `exabgp::default` - Includes the `exabgp_config` and `exabgp_service` resources

## Resources

### `exabgp`

The `exabgp` resource installs and configures ExaBGP. It _does not_ create
an ExaBGP service. You will need to handle this separately via your service
resource of choice.

#### Actions

* `:install` – Install and configure ExaBGP. *(default)*
* `:remove` – Remove ExaBGP and configuration file.

#### Parameters

* `instance` – Name of the ExaBGP installation. If different than the name
                parameter of the resource. If it is set to false, it will
                not use the name parameter when naming the instance. This
                is for backward compatibility with the older version of this
                cookbook where you may be running an install from
                `/etc/exabgp`.
* `cookbook` – Which cookbook to look for the exabgp.conf.erb template
* `variables` – Pass template variables in much like a template resource
* `install_type` – Supports both :package and :source installations. Defaults
                    to :package via python pip. If you'd like to support more
                    installation options, send in a pull request. :heart:

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

Copyright:: 2013-2016 Aetrion, LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
