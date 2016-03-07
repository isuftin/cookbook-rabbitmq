#
# Cookbook Name:: cida_rabbitmq
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "iptables::default"
include_recipe "rabbitmq::default"

iptables_rule 'rabbitmq_ports' do
  action :enable
end

data_bag_name = node['cida_rabbitmq']['credentials_data_bag_name']
data_bag_item = node['cida_rabbitmq']['credentials_data_bag_item']
encryption_key_path = node['cida_rabbitmq']['data_bag_encryption_key']
data_bag_username_field = node['cida_rabbitmq']['data_bag_username_field']
data_bag_password_field = node['cida_rabbitmq']['data_bag_password_field']

credential_data_bag = data_bag_item(data_bag_name, data_bag_item, IO.read(encryption_key_path))
username = credential_data_bag[data_bag_username_field]
pass = credential_data_bag[data_bag_password_field]

rabbitmq_user "guest" do
  action :delete
end

rabbitmq_user username do
  password pass
  action :add
end

rabbitmq_user username do
  permissions ".* .* .*"
  action :set_permissions
end

rabbitmq_user username do
  tag "administrator"
  action :set_tags
end
