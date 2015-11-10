# cida_rabbitmq

This cookbook allows you to install RabbitMQ and the RabbitMQ Manager and creates a default user (which you should set in your Chef environment). Also installs iptables and opens up ports 5672 and 15672.

Recipe assumes a databag encryption key has been placed on the OS. See attributes/default.rb for setting the encryption key file path. Also need to set the databag name to use for the user/pass configuration.

Example credentials databag, see environments/example_credentials_databag.json

Example databag creation:
```
knife data bag create yournewdatabagname  
knife data bag from file yournewdatabagname yourdatabagejsonfile.json --secret-file yourencryptionkeyfile  
```

On Chef server, be sure to set an environment which overrides the defaults, see environments/example.json