name             'cida_rabbitmq'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'Public Domain'
description      'Installs/Configures Rabbit MQ with sane defaults.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.5'

depends 'iptables'
depends 'rabbitmq'