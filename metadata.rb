name             'exabgp'
maintainer       'Aetrion, LLC dba DNSimple'
maintainer_email 'ops@dnsimple.com'
license          'Apache-2.0'
description      'Installs/Configures exabgp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.1.0'
source_url       'https://github.com/dnsimple/chef-exabgp'
issues_url       'https://github.com/dnsimple/chef-exabgp/issues'

chef_version '>= 12.1'
supports 'ubuntu', '>= 12.04'

depends 'compat_resource', '>= 12.5.11'
depends 'poise-python'
