# Cookbook Name:: azkaban2
# Recipe:: web server
#
# Copyright 2013, Yieldbot
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# == Recipes
include_recipe "java"

user = node[:azkaban][:user]
group = node[:azkaban][:group]
install_dir = "#{node[:azkaban][:install_dir]}/webserver"
version = node[:azkaban][:version]
fqdn = node[:fqdn].dup # use this as the assumed mysql host

ws_dir = "azkaban-#{version}"
tarball = "azkaban-web-server-#{version}.tar.gz"
download_file = "https://s3.amazonaws.com/azkaban2/azkaban2/#{version}/#{tarball}"

# create user
group group do
end

user user do
  comment "Azkaban user"
  gid "azkaban"
  home "/home/azkaban"
  shell "/bin/noshell"
  supports :manage_home => false
end

# create installation directory
directory "#{install_dir}" do
  owner user
  group group
  mode 00755
  recursive true
  action :create
end

# download and unpack tar
remote_file "#{Chef::Config[:file_cache_path]}/#{tarball}" do
  source download_file
  mode 00644
end

execute "tar" do
  user  user
  group group
  cwd install_dir
  command "tar zxvf #{Chef::Config[:file_cache_path]}/#{tarball}"
end

# download JDBC connector jar
# NB you'll need to host it internally somewhere
jdbc_jar = "mysql-connector.jar"

remote_file "#{install_dir}/#{ws_dir}/extlib/#{jdbc_jar}" do
  source node[:azkaban][:jdbc_jar_url]
  mode 00644
end

# set up templates
template "#{install_dir}/#{ws_dir}/bin/azkaban-web-start.sh" do
  source "azkaban-web-start.sh.erb"
  owner user
  group group
  mode  00755
end

template "#{install_dir}/#{ws_dir}/conf/azkaban.properties" do
  source "azkaban.properties.erb"
  owner user
  group group
  mode  00755
  variables({
      :mysql_host => fqdn
  })
end

# start process
execute "start webserver" do
  user user
  group group
  cwd "#{install_dir}/#{ws_dir}"
  command "bin/azkaban-web-start.sh &> webserver.out"
  action :run
end

