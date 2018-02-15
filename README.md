# cida_rabbitmq

[![Build Status](https://travis-ci.org/USGS-CIDA/cookbook-rabbitmq.svg?branch=master)](https://travis-ci.org/USGS-CIDA/cookbook-rabbitmq)

This cookbook allows you to install RabbitMQ and the RabbitMQ Manager and creates a default user (which you should set in your Chef environment). Also installs iptables and opens up ports 5672 and 15672.

Recipe assumes a data_bag encryption key has been placed on the OS. See attributes/default.rb for setting the encryption key file path. Also need to set the data_bag name to use for the user/pass configuration.

Example credentials data_bag, see environments/example_credentials_data_bag.json

Example data_bag creation:
```
knife data bag create yournewdata_bagname  
knife data bag from file yournewdata_bagname yourdata_bagejsonfile.json --secret-file yourencryptionkeyfile  
```

On Chef server, be sure to set an environment which overrides the defaults, see environments/example.json
