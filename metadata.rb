maintainer       "Yieldbot"
maintainer_email "hstrong@yieldbot.com"
license          "All rights reserved"
description      "Installs Azkaban"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ ntp java silverware }.each do |cb|
  depends cb
end
