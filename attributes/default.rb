# Cookbook Name:: azkaban2
# Attributes:: default
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

# Install
default[:azkaban][:version] = "2.1"
default[:azkaban][:install_dir] = "/usr/local"
default[:azkaban][:user] = "azkaban"
default[:azkaban][:group] = "azkaban"
default[:azkaban][:jdbc_jar_url] = ""
default[:azkaban][:tmp_dir] = "/tmp"

# webserver-specific
default[:azkaban][:jetty][:ssl_port] = 8443
default[:azkaban][:jetty][:max_threads] = 25

# Azkaban properties
default[:azkaban][:name] = "Local"
default[:azkaban][:label] = "My Local Azkaban"
default[:azkaban][:color] = "#FF3601"
default[:azkaban][:user_manager][:class] = "azkaban.user.XmlUserManager"

# talk to MySQL
default[:azkaban][:mysql][:database] = "azkaban"
default[:azkaban][:mysql][:user] = "azkaban"
default[:azkaban][:mysql][:password] = "azkaban"

# keystore configuration
default[:azkaban][:keystore][:name] = "keystore"
default[:azkaban][:keystore][:password] = "password"
default[:azkaban][:keystore][:key_password] = "password"
default[:azkaban][:truststore][:name] = "keystore"
default[:azkaban][:truststore][:password] = "password"
