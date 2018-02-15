#
# Cookbook Name:: cida_rabbitmq
# Recipe:: create_users
# Author: Ivan Suftin < isuftin@usgs.gov >
# Description: Creates the user(s) needed for RabbitMQ function
rabbit_attributes = node['cida_rabbitmq']
data_bag_name = rabbit_attributes['credentials_data_bag_name']
data_bag_item = rabbit_attributes['credentials_data_bag_item']
data_bag_users_field = rabbit_attributes['data_bag_users_field']
credential_data_bag = data_bag_item(data_bag_name, data_bag_item)
users = credential_data_bag[data_bag_users_field]

include_recipe 'rabbitmq::default'
include_recipe 'rabbitmq::virtualhost_management'

node['rabbitmq']['enabled_users'].each do |user|
  next unless users.key?(user['name'])
  rabbitmq_user user['name'] do
    password users[user['name']]
    action :add
  end
  rabbitmq_user user['name'] do
    tag user['tag']
    action :set_tags
  end
  user['rights'].each do |r|
    rabbitmq_user user['name'] do
      vhost r['vhost']
      permissions "#{r['conf']} #{r['write']} #{r['read']}"
      action :set_permissions
    end
  end
end

node['rabbitmq']['disabled_users'].each do |user|
  rabbitmq_user user do
    action :delete
  end
end
