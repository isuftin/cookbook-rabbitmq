default["cida_rabbitmq"] = {
  "credentials_data_bag_name" => "cida_rabbitmq_credentials",
  "data_bag_encryption_key" => "/etc/chef/data-bag-encryption-key",
  "data_bag_username_field" => "username",
  "data_bag_password_field" => "password"
}

default["rabbitmq"]["loopback_users"] = []
default["rabbitmq"]["enabled_users"] = []
default["rabbitmq"]["disabled_users"] = ["guest"]
