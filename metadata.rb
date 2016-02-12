name             'exabgp'
maintainer       'Aetrion, LLC.'
maintainer_email 'ops@dnsimple.com'
license          'Apache 2.0'
description      'Installs/Configures exabgp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.0.1'

supports 'ubuntu', '>= 12.04'

depends 'compat_resource', '>= 12.5.11'

suggests 'poise-python'
suggests 'runit'
