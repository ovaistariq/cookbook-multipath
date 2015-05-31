#!/usr/bin/env bats

@test 'multipath configuration sets user_friendly_names to yes' {
    grep "user_friendly_names yes" /etc/multipath.conf
}

@test 'multipath configuration configures the correct vendor' {
    grep 'vendor "PURE"' /etc/multipath.conf
}

@test 'multipath configuration configures the correct alias' {
  grep "wwid 3624a937017bcaa64842651bf00015fea" /etc/multipath.conf
}