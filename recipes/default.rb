#
# Cookbook Name:: delivery_supermarket
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# read the local supermareket.json file and extract
# the oauth2 app id and secret.  This file comes from
# chef Server

config = JSON.parse(File.read('/mnt/share/chef/supermarket.json' ))
puts "config is ", config.to_s
uid = config['uid']
secret = config['secret']
node.override['supermarket_omnibus']['chef_oauth2_app_id'] = uid
node.override['supermarket_omnibus']['chef_oauth2_secret'] = secret
#  chef_server_url: 'https://chef.myorg.chefdemo.net'
# puts "uid is ------ ", uid
# puts "secret is ----- ", secret
include_recipe 'supermarket-omnibus-cookbook::default'
