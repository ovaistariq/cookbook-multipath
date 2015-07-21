#!/usr/bin/env bats

@test 'multipath configuration sets default user_friendly_names to yes' {
    grep -A 1 "defaults {" /etc/multipath.conf |grep "user_friendly_names yes"
}

@test 'multipath configuration sets default find_multipaths to yes' {
    grep -A 2 "defaults {" /etc/multipath.conf |grep "find_multipaths yes"
}

@test 'multipath configuration sets default queue_without_daemon to no' {
    grep -A 3 "defaults {" /etc/multipath.conf |grep "queue_without_daemon no"
}

@test 'multipath configuration sets default max_fds to max' {
    grep -A 4 "defaults {" /etc/multipath.conf |grep "max_fds max"
}

@test 'multipath configuration sets device product to OPEN-d*' {
    grep -A 4 "device {" /etc/multipath.conf |grep "product[[:space:]][[:punct:]]OPEN-d"
}

@test 'multipath configuration sets OPEN-d* device vendor to HP' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 1 "product[[:space:]][[:punct:]]OPEN-d" |grep "vendor[[:space:]][[:punct:]]HP"
}

@test 'multipath configuration sets OPEN-d* device path_grouping_policy to multibus' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 2 "product[[:space:]][[:punct:]]OPEN-d" |grep "path_grouping_policy[[:space:]]multibus"
}

@test 'multipath configuration sets OPEN-d* device rr_min_io to 1000' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 3 "product[[:space:]][[:punct:]]OPEN-d" |grep "rr_min_io[[:space:]]1000\>"
}

@test 'multipath configuration sets device product to HSV200' {
    grep -A 4 "device {" /etc/multipath.conf |grep "product[[:space:]][[:punct:]]HSV200"
}

@test 'multipath configuration sets HSV200 device vendor to HP' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 1 "product[[:space:]][[:punct:]]HSV200" |grep "vendor[[:space:]][[:punct:]]HP"
}

@test 'multipath configuration sets HSV200 device path_grouping_policy to group_by_prio' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 2 "product[[:space:]][[:punct:]]HSV200" |grep "path_grouping_policy[[:space:]]group_by_prio"
}

@test 'multipath configuration sets HSV200 device rr_min_io to 1000' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 3 "product[[:space:]][[:punct:]]HSV200" |grep "rr_min_io[[:space:]]100\>"
}

@test 'multipath configuration sets device product to Invista' {
    grep -A 4 "device {" /etc/multipath.conf |grep "product[[:space:]][[:punct:]]Invista"
}

@test 'multipath configuration sets Invista device vendor to EMC' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 1 "product[[:space:]][[:punct:]]Invista" |grep "vendor[[:space:]][[:punct:]]EMC"
}

@test 'multipath configuration sets Invista device path_grouping_policy to multibus' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 2 "product[[:space:]][[:punct:]]Invista" |grep "path_grouping_policy[[:space:]]multibus"
}

@test 'multipath configuration sets Invista device product_blacklist to LUNZ' {
    grep -A 4 "device {" /etc/multipath.conf |grep -A 3 "product[[:space:]][[:punct:]]Invista" |grep "product_blacklist[[:space:]][[:punct:]]LUNZ\>"
}
