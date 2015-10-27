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
