name             "multipath"
maintainer       "Ovais Tariq"
maintainer_email "me@ovaistariq.net"
license          "Apache 2.0"
description      "Installs and configures device-mapper-multipath"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
recommends       "iscsi"
recommends       "dbench"
version          "0.0.9"
source_url       "https://github.com/atomic-penguin/cookbook-multipath"
issues_url       "https://github.com/atomic-penguin/cookbook-multipath/issues"

%w{ redhat centos scientific amazon oracle }.each do |os|
  supports os, ">= 5.0"
end

%w{ debian ubuntu }.each do |os|
  supports os
end

attribute "multipath/blacklist_regex",
  :display_name => "multipath/blacklist_regex",
  :description => "An array of regular expression strings for blacklisting devices",
  :required => "recommended"

attribute "multipath/blacklist_wwid",
  :display_name => "multipath/blacklist_wwid",
  :description => "An array of Worldwide Identifiers for blacklisting devices",
  :required => "recommended"

attribute "multipath/storage_type",
  :display_name => "multipath/storage_type",
  :choice => [ "default", "equallogic", "clariion", "powervault" ],
  :description => "default",
  :required => "optional",
  :default => "default"

attribute "multipath/aliases",
  :display_name => "multipath/aliases",
  :required => "optional",
  :description => "An array of alias:wwid mappings"
