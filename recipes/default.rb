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

databag_name = node['cida_rabbitmq_credentials_databag_name']
encryption_key_path = node['cida_rabbitmq_databag_encryption_key']
credential_databag = data_bag_item(databag_name, 'cida_rabbitmq_credentials', IO.read(encryption_key_path))
username = credential_databag['username']
pass = credential_databag['password']

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
