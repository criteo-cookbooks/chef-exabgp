# exabgp cookbook

Installs and configures [ExaBGP](https://github.com/Exa-Networks/exabgp)
the swiss-army knife of networking.

## Supported Chef and Platforms

* Chef 12.1 and newer

* Ubuntu 12.04
* Ubuntu 14.04

## Dependencies

* python
* runit (default for service setup)
* git (default for source installation)

## Attributes

| Attribute | Description | Default Value |
| --- | --- | --- |
| `node['exabgp']['bin_path']` | Location of the ExaBGP binary | `/usr/local/bin/exabgp` |
| `node['exabgp']['config_path']` | Location of the ExaBGP configuration file | `/etc/exabgp/exabgp.conf` |
| `node['exabgp']['package_version']` | The version of the python package to install | `master` |
| `node['exabgp']['source_url']` | URL to the git repository for source installtions | `https://github.com/Exa-Networks/exabgp.git` |
| `node['exabgp']['source_version']` | git ref of the version to install | `master` |

## Recipes

| Recipe | Description |
| --- | --- |
| `default` | Includes the `exabgp_config` and `exabgp_service` resources |
| `package` | Installs ExaBGP via python packages |
| `source`  | Installs ExaBGP via git from the project repository |

## Resources

### `exabgp_config`

The `exabgp_config` resource configures an exabgp instance.

```ruby
exabgp_config 'anycast' do
  config_path '/etc/exabgp/exabgp.conf'
end
```

### `exabgp_service`

The `exabgp_service` resource controls the service configuration for a
configured exabgp instance.

```ruby
exabgp_service 'anycast' do
  bin_path '/usr/local/bin/exabgp'
end
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
