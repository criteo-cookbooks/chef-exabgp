name             'exabgp'
maintainer       'DNSimple Corp'
maintainer_email 'ops@dnsimple.com'
license          'Apache-2.0'
description      'Installs and configures ExaBGP. The Swiss Army Knife of Networking.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.2.0'
source_url       'https://github.com/dnsimple/chef-exabgp'
issues_url       'https://github.com/dnsimple/chef-exabgp/issues'

chef_version '>= 13.10'
supports 'ubuntu', '>= 14.04'

depends 'poise-python'
