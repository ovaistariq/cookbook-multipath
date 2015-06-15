#!/usr/bin/env bats

@test 'multipath configuration sets udev_dir to /dev' {
    grep "udev_dir /dev" /etc/multipath.conf
}

@test 'multipath configuration sets find_multipaths to yes' {
    grep "find_multipaths yes" /etc/multipath.conf
}

@test 'multipath configuration sets polling_interval to 15' {
    grep "polling_interval 15" /etc/multipath.conf
}

@test 'multipath configuration sets path_selector to "round-robin 0"' {
    grep "path_selector \"round-robin 0\"" /etc/multipath.conf
}

@test 'multipath configuration sets user_friendly_names to yes' {
    grep "user_friendly_names yes" /etc/multipath.conf
}

@test 'multipath configuration sets queue_without_daemon to no' {
    grep "queue_without_daemon no" /etc/multipath.conf
}

@test 'multipath configuration sets max_fds to max' {
    grep "max_fds max" /etc/multipath.conf
}

@test 'multipath configuration sets uid to 0' {
    grep "uid 0" /etc/multipath.conf
}

@test 'multipath configuration sets gid to 0' {
    grep "gid 0" /etc/multipath.conf
}

@test 'multipath configuration configures the correct vendor' {
    grep 'vendor "COMPAQ"' /etc/multipath.conf
}

@test 'multipath configuration configures the correct product' {
    grep 'product "HSV101 \\(C\\)COMPAQ"' /etc/multipath.conf
}

@test 'multipath configuration sets path_grouping_policy to group_by_prio' {
    grep 'path_grouping_policy group_by_prio' /etc/multipath.conf
}

@test 'multipath configuration sets getuid_callout to correctly' {
    grep 'getuid_callout \"/sbin/scsi_id --whitelisted --replace-whitespace --device=/dev/%n\"' /etc/multipath.conf
}

@test 'multipath configuration sets path_checker to tur' {
    grep 'path_checker tur' /etc/multipath.conf
}

@test 'multipath configuration sets prio to hds' {
    grep 'prio hds' /etc/multipath.conf
}

@test 'multipath configuration sets failback to immediate' {
    grep 'failback immediate' /etc/multipath.conf
}

@test 'multipath configuration sets rr_weight to uniform' {
    grep 'rr_weight uniform' /etc/multipath.conf
}

@test 'multipath configuration sets no_path_retry to 10' {
    grep 'no_path_retry 10' /etc/multipath.conf
}

@test 'multipath configuration sets rr_min_io_rq to 16' {
    grep 'rr_min_io_rq 16' /etc/multipath.conf
}

