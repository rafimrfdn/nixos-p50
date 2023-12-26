{config, pkgs, ...}:

{

programs.waybar = {
    enable = true;
    systemd.enable = false;
    style = ''
          ${builtins.readFile ./style.css}
    '';

    settings = [{
        "layer" = "top";
        "position" = "top";
        "height" = 10;
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "wlr/workspaces"
          "temperature"
          "custom/uptime"
          "custom/borderright"
          #"idle_inhibitor"
          #"custom/wall"
          #"mpd"
          #"custom/cava-internal"
        ];
        modules-center = [
          #"custom/centerborderleft"
          "clock"
          #"custom/centerborderright"
        ];
        modules-right = [
          "custom/borderleft"
          "pulseaudio"
          "backlight"
          "memory"
          "cpu"
         #"network"
          "battery"
         #"bluetooth"
          "custom/powermenu"
          "tray"
        ];
        # "bluetooth"= {
        #     "format"= " {status}";
        #     "format-connected"= " {device_alias}";
        #     "format-connected-battery"= " {device_alias} {device_battery_percentage}%";
        #     "tooltip-format"= "{controller_alias}\\t{controller_address}\\n\\n{num_connections} connected";
        #     "tooltip-format-connected"= "{controller_alias}\\t{controller_address}\\n\\n{num_connections} connected\\n\\n{device_enumerate}";
        #     "tooltip-format-enumerate-connected"= "{device_alias}\\t{device_address}";
        #     "tooltip-format-enumerate-connected-battery"= "{device_alias}\\t{device_address}\\t{device_battery_percentage}%";
        # };
        "custom/launcher" = {
          "format" = " ";
          /** "on-click" = "pkill rofi || ~/.config/rofi/launcher.sh";**/
          "on-click" = "pkill wofi || wofi --show drun -I || pkill wofi";
          "tooltip" = false;
        };
        "custom/wall" = {
          "on-click" = "wallpaper_random";
          "on-click-middle" = "default_wall";
          "on-click-right" = "killall dynamic_wallpaper || dynamic_wallpaper &";
          "format" = " ﴔ ";
          "tooltip" = false;
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };
        # for sway use wlr/workspace 
        "wlr/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "format-icons"= {
            "1"= "";
            "2"= "";
            "3"= "";
            "4"= "";
            "5"= "";
            "urgent"= "";
            "active"= "";
            "default"= "";
          };
          "sort-by-number"= true;
          # "on-scroll-up" = "hyprctl dispatch workspace e+1";
          # "on-scroll-down" = "hyprctl dispatch workspace e-1";
        };
        # for hyprland use hyprland/workspace
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "format-icons"= {
            "1"= "1";
            "2"= "2";
            "3"= "3";
            "4"= "4";
            "5"= "5";
            "6"= "6";
            "7"= "7";
            "8"= "8";
            "9"= "9";
           # "urgent"= "";
           # "active"= "";
           # "default"= "";
          };
          "sort-by-number"= true;
          # "on-scroll-up" = "hyprctl dispatch workspace e+1";
          # "on-scroll-down" = "hyprctl dispatch workspace e-1";
          # read more : https://github.com/Alexays/Waybar/wiki/Module:-Workspaces
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
          "tooltip" = false;
        };
        "backlight" = {
          "device" = "intel_backlight";
          "scroll-step" = 2;
          "on-scroll-up" = "light -A 5";
          "on-scroll-down" = "light -U 5";
          "format" = "{icon} {percent}%";
          "format-icons" = [ "  " "  " "  " "  " ];
        };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "婢 Muted";
          "format-icons" = {
            "default" = [ "  " "  " "  " ];
            "headphones" = "";
          };
          /**"states" = {
            "warning" = 85;
          };**/
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };
        "battery" = {
          "interval" = 10;
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "format" = "{icon} {capacity}%";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
          "format-full" = "{icon} {capacity}%";
           /* "format-charging" = " {capacity}%";*/
          "format-charging" = " {capacity}%";
          "tooltip" = false;
        };
        "clock"= {
          	"format"= "{:%H:%M}  ";
          	"format-alt"= "{:%A, %B %d, %Y (%R)}  ";
          	"tooltip-format"= "<tt><small>{calendar}</small></tt>";
          	"calendar"= {
          		"mode"          = "year";
          		"mode-mon-col"  = 3;
          		"weeks-pos"     = "right";
          		"on-scroll"     = 1;
          		"on-click-right"= "mode";
          		"format"= {
          			"months"=     "<span color='#ffead3'><b>{}</b></span>";
          			"days"=       "<span color='#ecc6d9'><b>{}</b></span>";
          			"weeks"=      "<span color='#99ffdd'><b>W{}</b></span>";
          			"weekdays"=   "<span color='#ffcc66'><b>{}</b></span>";
          			"today"=      "<span color='#ff6699'><b><u>{}</u></b></span>";
          		};
          	};
          	"actions"= {
          		"on-click-right"= "mode";
          		"on-click-forward"= "tz_up";
          		"on-click-backward"= "tz_down";
          		"on-scroll-up"= "shift_up";
          		"on-scroll-down"= "shift_down";
          	};
          };

        "memory" = {
          "interval" = 1;
          /* "format" = "﬙ {percentage}%";
          "format" = " {percentage}%";*/
           "format" = "  {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "  {usage}%";
        };
        /**"mpd" = {
          "max-length" = 25;
          "format" = "<span foreground='#bb9af7'></span> {title}";
          "format-paused" = " {title}";
          "format-stopped" = "<span foreground='#bb9af7'></span>";
          "format-disconnected" = "";
          "on-click" = "mpc --quiet toggle";
          "on-click-right" = "mpc update; mpc ls | mpc add";
          "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
          "on-scroll-up" = "mpc --quiet prev";
          "on-scroll-down" = "mpc --quiet next";
          "smooth-scrolling-threshold" = 5;
          "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
        };**/
        "network" = {
          "interval" = 1;
          "format-wifi" = "說 {essid}";
          "format-ethernet" = "  {ifname} ({ipaddr})";
          "format-linked" = "說 {essid} (No IP)";
          "format-disconnected" = "說 Disconnected";
          "tooltip" = false;
        };
        "temperature" = {
          /* "hwmon-path"= "${env:HWMON_PATH}";
          #"critical-threshold"= 80;*/
          "tooltip" = false;
          "format" = " {temperatureC}°C";
        };
        "custom/uptime" = {
          /*"format" = "Uptime {uptime | awk '{print $3 }' | sed 's/,/ /' }";*/
          "format" = "󱎴  {}";
          /*"exec" = "~/.config/waybar/uptime.sh";*/
          "exec" = "uptime | awk '{print $3 }' | sed 's/,/ /'";
          "interval" = 1;
          "tooltip" = false;
        };
        "custom/borderleft" = {
          "format" = "";
          /**"format" = "";**/
          "tooltip" = false;
        };
        "custom/centerborderleft" = {
          "format" = "";
          /**"format" = "";**/
          "tooltip" = false;
        };
        "custom/centerborderright" = {
          "format" = "";
          /**"format" = "";**/
          "tooltip" = false;
        };
        "custom/borderright" = {
          /**"format" = "";**/
         "format" = "";
          /**"format" = "";**/
          "tooltip" = false;
        };
        "custom/powermenu" = {
          "format" = "";
          # "on-click" = "pkill rofi || ~/.scripts/powermenu.sh";
          "on-click" = "pkill wlogout || wlogout";
          "tooltip" = false;
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
      }];
  };
}
