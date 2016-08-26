#
# Cookbook Name:: cida_rabbitmq
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "iptables::default"
include_recipe "rabbitmq::default"
include_recipe "cida_rabbitmq::create_users"
include_recipe "rabbitmq::user_management"
include_recipe "rabbitmq::mgmt_console"
include_recipe "cida_rabbitmq::rabbitmq_iptables"
