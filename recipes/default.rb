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

databag_name = node['cida_rabbitmq']['credentials_databag_name']
encryption_key_path = node['cida_rabbitmq']['databag_encryption_key']
databag_username_field = node['cida_rabbitmq']['databag_username_field']
databag_password_field = node['cida_rabbitmq']['databag_password_field']

credential_databag = data_bag_item(databag_name, databag_name, IO.read(encryption_key_path))
username = credential_databag[databag_username_field]
pass = credential_databag[databag_password_field]

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
