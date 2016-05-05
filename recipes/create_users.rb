#
# Cookbook Name:: cida_rabbitmq
# Recipe:: create_users
# Author: Ivan Suftin < isuftin@usgs.gov >
# Description: Creates the user(s) needed for RabbitMQ function

data_bag_name = node['cida_rabbitmq']['credentials_data_bag_name']
data_bag_item = node['cida_rabbitmq']['credentials_data_bag_item']
data_bag_username_field = node['cida_rabbitmq']['data_bag_username_field']
data_bag_password_field = node['cida_rabbitmq']['data_bag_password_field']

credential_data_bag = data_bag_item(data_bag_name, data_bag_item)
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