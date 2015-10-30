# cida_rabbitmq

This cookbook allows you to install RabbitMQ and the RabbitMQ Manager and creates a default user (which you should set in your Chef environment). Also installs iptables and opens up ports 5672 and 15672.

Recipe assumes a databag encryption key has been placed on the OS. See attributes/default.rb for setting the encryption key file path. Also need to set the databag name to use for the user/pass configuration.

Example credentials databag:
```
{
	"id" : "cida_rabbitmq_credentials",  
	"username" : "username",  
	"password" : "password  
}
```

Example databag creation:
```
knife data bag create yournewdatabagname  
knife data bag from file yournewdatabagname yourdatabagejsonfile.json --secret-file yourencryptionkeyfile  
```

On Chef server, be sure to set an environment which overrides these defaults:  
1. cida_rabbitmq_credentials_databag_name - name of the databag which contains info above  
2. cida_rabbitmq_databag_encryption_key - location of the encryption key on the target instance  