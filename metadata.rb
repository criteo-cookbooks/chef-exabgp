name             'exabgp'
maintainer       'Aetrion, LLC dba DNSimple'
maintainer_email 'ops@dnsimple.com'
license          'Apache-2.0'
description      'Installs/Configures exabgp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.2.0'
source_url       'https://github.com/dnsimple/chef-exabgp'
issues_url       'https://github.com/dnsimple/chef-exabgp/issues'

chef_version '>= 12.6'
supports 'ubuntu', '>= 14.04'

depends 'poise-python'
