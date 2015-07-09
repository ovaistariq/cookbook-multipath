if node['multipath']['storage_type'] == "customized"
  default['multipath']['defaults']['user_friendly_names'] = "yes"
  default['multipath']['defaults']['find_multipaths'] =  "yes"
end
