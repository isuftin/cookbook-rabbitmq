#
# Cookbook Name:: cida_rabbitmq
# Recipe:: rabbitmq_iptables
# Author: Ivan Suftin < isuftin@usgs.gov >
# Description: Creates the IPTables allowances required for RabbitMQ

iptables_rule 'rabbitmq_ports' do
  action :enable
end