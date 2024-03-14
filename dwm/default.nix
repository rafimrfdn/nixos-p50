{config, pkgs, ...}:

{
  # DWM
  services.xserver.windowManager.dwm.enable = true;
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

 #  nixpkgs.overlays = [
 #    (final: prev: {
 #      dwm = prev.dwm.overrideAttrs (old: { src = ./dwm/dwm-6.3; });
 #    })
 #    (self: super: {
 #      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
 #        patches = [
 #         ./dwm/dwm-systray-6.3.diff
 #         ./dwm/dwm-cool-autostart-6.2.diff
 #         ./dwm/dwm-ru_gaps-6.3.diff
 #         ./dwm/dwm-ru_bottomstack-6.2.diff
 #         ./dwm/dwm-warp-6.2.diff
 #         ./dwm/dwm-alwayscenter.diff
 #         ./dwm/dwm-pertag.diff
 #         ./dwm/dwm-hide_vacant_tags-6.3.diff
 #        ];
 #        configFile = super.writeText "config.h" (builtins.readFile ./dwm/config.h);
 #        postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
 #      });
 #      st = super.st.overrideAttrs (oldAttrs: rec {
 #        patches = [
	# ./st/st-scrollback-0.8.5.diff
	# ./st/st-alpha-20220206-0.8.5.diff
	# ./st/st-anysize-20220718-baa9357.diff
	# ./st/st-w3m-0.8.3.diff
 #        ];
 #      });
 #    })
 #  ];
}
