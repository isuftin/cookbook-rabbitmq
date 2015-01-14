#
# Cookbook Name:: cida_rabbitmq
# Recipe:: mgmt_console
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: 

include_recipe "rabbitmq::user_management"
include_recipe "rabbitmq::mgmt_console"