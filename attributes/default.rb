#
# Cookbook Name:: multipath 
# Attributes:: default 
#
# Copyright 2010-2012, Eric G. Wolfe
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
#

# Default case is for RedHat family
default['multipath']['packages'] = %w{ device-mapper-multipath }
default['multipath']['service'] = "multipathd"
case node['platform'] when "debian","ubuntu"
  default['multipath']['packages'] = %w{ multipath-tools }
  default['multipath']['service'] = "multipath-tools"
end

default['multipath']['blacklist_regex'] = [ "^sd[a]$" ]
default['multipath']['blacklist_wwid'] = Array.new
default['multipath']['storage_type'] = "default"
default['multipath']['aliases'] = Array.new
