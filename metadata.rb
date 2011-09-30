maintainer       "Eric G. Wolfe"
maintainer_email "wolfe21@marshall.edu"
license          "Apache 2.0"
description      "Installs and configures device-mapper-multipath"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
recommends       "iscsi"
recommends       "dbench"
version          "0.0.4"

attribute "multipath/blacklist_regex",
  :display_name => "multipath/blacklist_regex",
  :description => "An array of regular expression strings for blacklisting devices"

attribute "multipath/blacklist_wwid",
  :display_name => "multipath/blacklist_wwid",
  :description => "An array of Worldwide Identifiers for blacklisting devices"

attribute "multipath/storage_type",
  :display_name => "multipath/storage_type",
  :choice => [ "default", "equallogic", "clariion", "powervault" ],
  :description => "default",
  :default => "default"

attribute "multipath/aliases",
  :display_name => "multipath/aliases",
  :description => "An array of alias:wwid mappings"
