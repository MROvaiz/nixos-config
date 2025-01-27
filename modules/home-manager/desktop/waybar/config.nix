{pkgs, ...}: {
  mainBar = {
    "modules-left" = [
      "custom/icon-left-outer"
      "group/group-power"
      "custom/icon-split"
      "hyprland/workspaces"
      "custom/icon-right"
    ];
    "modules-center" = [
      "custom/icon-left"
      "clock"
      "custom/icon-right"
    ];
    "modules-right" = [
      "custom/icon-left"
      "network"
      "custom/icon-split"
      "memory"
      "custom/icon-split"
      "cpu"
      "custom/icon-split"
      # "battery"
      "tray"
      "custom/icon-split"
      "pulseaudio"
      "custom/icon-split"
      "pulseaudio#microphone"
      "custom/icon-right-outer"
    ];
    # "tray" = {
    # };
    "clock" = {
      "interval" = 1;
      "tooltip" = true;
      "format" = "{:%H:%M:%S}";
      "max-length" = 25;
      "tooltip-format" = "{:%Y-%m-%d}";
    };
    "hyprland/workspaces" = {
      "format" = "{icon} {windows}";
      "window-rewrite-default" = "";
      "window-rewrite" = {
        "title<.*youtube.*>" = "";
        "class<firefox>" = "";
        "class<firefox> title<.*github.*>" = "";
        "kitty" = "";
        "code" = "󰨞";
        "dolphin" = "";
      };
    };
    "battery" = {
      "bat" = "BAT0";
      "interval" = 10;
      "states" = {
        "warning" = 30;
        "critical" = 15;
      };
      "format" = "{capacity}% {icon}";
      "format-charging" = "{capacity}% 󰂄";
      "format-icons" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      "max-length" = 25;
    };
    "pulseaudio" = {
      "format" = "{icon} {volume}%";
      "format-muted" = "󰝟 0%";
      "format-icons" = {"default" = ["󰕿" "󰖀" "󰕾"];};
      "on-click" = "pamixer -t";
      "on-click-right" = "pavucontrol";
    };
    "pulseaudio#microphone" = {
      "format" = "{format_source}";
      "format-source" = "󰍬 {volume}%";
      "format-source-muted" = "󰍭 0%";
      "on-click" = "pamixer --default-source -t";
      "on-click-right" = "pavucontrol";
    };
    "cpu" = {
      "interval" = 1;
      "format" = "CPU {icon0}{icon1}{icon2}{icon3}{icon4}";
      "format-icons" = [
        "<span color='#69ff94'>▁</span>"
        "<span color='#2aa9ff'>▂</span>"
        "<span color='#f8f8f2'>▃</span>"
        "<span color='#f8f8f2'>▄</span>"
        "<span color='#ffffa5'>▅</span>"
        "<span color='#ffffa5'>▆</span>"
        "<span color='#ff9977'>▇</span>"
        "<span color='#dd532e'>█</span>"
      ];
    };
    "memory" = {
      "interval" = 30;
      "format" = "{used:0.1f}GB/{total:0.1f}GB";
    };
    "network" = {
      "format" = "{ifname}";
      "format-wifi" = "{essid} ({signalStrength}%) ";
      "format-ethernet" = "Connected 󰈀";
      "format-disconnected" = "Disconnected";
      "tooltip-format" = "{ifname} via {gwaddr} 󰈀";
      "tooltip-format-wifi" = "{ipaddr} ";
      "tooltip-format-ethernet" = "{ifname} ({ipaddr}) 󰈀";
      "tooltip-format-disconnected" = "Disconnected";
      "max-length" = 50;
    };

    "custom/logo" = {
      "format" = "";
    };

    "group/group-power" = {
      "orientation" = "inherit";
      "drawer" = {
        "transition-duration" = 500;
        "children-class" = "not-power";
        "transition-left-to-right" = true;
      };
      "modules" = [
        "custom/logo"
        "custom/lock"
        "custom/reboot"
        "custom/power"
      ];
    };

    "custom/icon-arch" = {
      "exec" = "echo '󰣇'";
      "interval" = 0;
    };
    "custom/icon-left" = {
      "exec" = "echo '✦'";
      "interval" = 0;
    };
    "custom/icon-left-outer" = {
      "exec" = "echo '✦'";
      "interval" = 0;
    };
    "custom/icon-split" = {
      "exec" = "echo '|'";
      "interval" = 0;
    };
    "custom/icon-right" = {
      "exec" = "echo '✦'";
      "interval" = 0;
    };
    "custom/icon-right-outer" = {
      "exec" = "echo '✦'";
      "interval" = 0;
    };

    "custom/lock" = {
      "format" = "󰍁";
      "tooltip" = false;
      "on-click" = "hyprlock";
    };
    "custom/reboot" = {
      "format" = "󰜉";
      "tooltip" = false;
      "on-click" = "reboot";
    };
    "custom/power" = {
      "format" = "";
      "tooltip" = false;
      "on-click" = "shutdown now";
    };
  };
}
