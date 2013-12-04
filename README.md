Description
===========

Installs Azkaban2. http://azkaban.github.io/azkaban2/

NB this cookbook is meant for use with ironfan.

Requirements
============
* Java cookbook version >= 1.5
* MySQL server available and already set up.
* expects keystore to already be set up

Setting up the keystore can be done by executing

`keytool -keystore keystore -alias jetty -genkey -keyalg RSA`

and going through the dialog. See the page below for more information.

http://docs.codehaus.org/display/JETTY/How+to+configure+SSL

Attributes
==========

See `attributes/default.rb`.

Usage
=====

* web_server - installs azkaban web server
* executor_server - installs azkaban executor server
* TODO mysql_setup - runs mysql setup scripts
* TODO keystore_setup - would set up keystore

= LICENSE and AUTHOR:

Author:: Homer Strong

Copyright:: 2013, Yieldbot

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.