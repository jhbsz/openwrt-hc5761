#!/bin/sh
append DRIVERS "mt7610e"

. /lib/wifi/ralink_common.sh

prepare_mt7610e() {
	prepare_ralink_wifi mt7610e
}

scan_mt7610e() {
	scan_ralink_wifi mt7610e mt7610e
}

disable_mt7610e() {
	disable_ralink_wifi mt7610e
}

enable_mt7610e() {
	enable_ralink_wifi mt7610e mt7610e
}

detect_mt7610e() {
#	detect_ralink_wifi mt7610e mt7610e
	cd /sys/module
	[ -d $module ] || return
	uci get wireless.mt7610e >/dev/null 2>&1 && return
	ifconfig rai0 >/dev/null 2>&1 || return
	# NOTICE: Set type 'broadcom' for cheating LuCI
	# to list all configuration capabilities.
	cat <<EOF
config wifi-device mt7610e
	option type broadcom
	option vendor ralink
	option band 5G
	option channel 0
	option autoch 2

config wifi-iface
	option device mt7610e
	option ifname rai0
	option network lan
	option mode ap
	option ssid OpenWrt-5G
	option encryption none

EOF

}

prepare_broadcom() { prepare_mt7610e "$@"; }
scan_broadcom()    { scan_mt7610e "$@"; }
disable_broadcom() { disable_mt7610e "$@"; }
enable_broadcom()  { enable_mt7610e "$@"; }

