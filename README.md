# Multipath [![Build Status](https://secure.travis-ci.org/atomic-penguin/cookbook-multipath.png?branch=master)](http://travis-ci.org/atomic-penguin/cookbook-multipath)

## Description

  This cookbook provides provides the ability to configure Device Mapper
Multipath MPIO for Fibre-Channel and iSCSI storage attached systems.

  A generic template, as well as four vendor-specific templates are included
within this cookbook.  Included vendor-specific templates are for
Equallogic iSCSI, EMC Clariion, Dell Powervault MDxxxx and PureStorage
storage arrays.

## Requirements

### Recommended Cookbooks

  * iscsi
  * dbench

## Attributes

### multipath.conf template

  * multipath (namespace)
    - ["blacklist_regex"]: An array of regular expressions to blacklist. Default '^sd[a]$'
    - ["blacklist_wwid"]: An array of World-Wide Identifiers (WWID) to blacklist.  Default empty.
    - ["aliases"]: A colon separated mapping of WWID to assign a friendly name.  Default empty.
    - ["storage_type"]: Select a vendor-specific multipath template (equallogic, powervault, clariion, default)

## Usage

  Set node specific overrides, and add recipe["multipath"] to the run_list

Example multipath node configuration for an EMC Clariion array. The keys, u01
through u03 are "friendly" name aliases for the storage paths.

```json
"normal": {
  "multipath": {
      "storage_type": "clariion",
      "blacklist_regex": [ "^sd[ab]$" ],
      "blacklist_wwid": [
        "3600508e000000000a02ffd9698283e07",
        "3600508e000000000bb2f2d55b328ee05",
        "350060160b9a03c9450060160b9a03c94"
      ],
      "aliases": [
        "u01:36006016005041f00d8f65c69ec56df11",
        "u02:36006016005041f00d9f65c69ec56df11",
        "u03:36006016005041f00daf65c69ec56df11"
      ]
  }
}
```

### multipath::undo recipe

A run-once recipe to undo the default recipe.  Inspired by the `annoyances` cookbook.

## License and Author

Copyright 2015, Ovais Tariq <me@ovaistariq.net>  
Copyright 2010-2012, Eric G. Wolfe

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
