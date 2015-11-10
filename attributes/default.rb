default["cida_rabbitmq"] = {
  "credentials_databag_name" => "cida_rabbitmq_credentials",
  "databag_encryption_key" => "/etc/chef/databag-encryption-key",
  "databag_username_field" => "username",
  "databag_password_field" => "password"
}

default["rabbitmq"]["loopback_users"] = []
default["rabbitmq"]["enabled_users"] = []
default["rabbitmq"]["disabled_users"] = ["guest"]
