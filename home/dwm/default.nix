{ config, pkgs, ... }:

{
  services.dwm-status.enable = true;
  services.dwm-status.order = [ "backlight" "time" "battery"  ];
  services.dwm-status.extraConfig = ''
  	debug = false
	separator = "    "
	
	[audio]
	control = "Master"
	mute = "ﱝ"
	template = "{ICO} {VOL}%"
	icons = ["奄", "奔", "墳"]
	
	[backlight]
	device = "intel_backlight"
	template = "{ICO} {BL}%"
	icons = ["", "", ""]

	[battery]
	charging = ""
	discharging = ""
	enable_notifier = true
	no_battery = ""
	notifier_critical = 10
	notifier_levels = [2, 5, 10, 15, 20]
	separator = " · "
	icons = ["", "", "", "", "", "", "", "", "", "", ""]
	
	[cpu_load]
	template = "{CL1} {CL5} {CL15}"
	update_interval = 20
	
	[network]
	no_value = "NA"
	template = "{IPv4} · {IPv6} · {ESSID}"
	
	[time]
	format = "%d-%m-%Y %H:%M"
	update_seconds = false
  '';
}
