{
  lib,
  pkgs,
  inputs,
  config,
  osConfig,
  ...
}: let
  wallpaper = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/MROvaiz/wallpapers/main/star-dropping.jpg";
    sha256 = "0xr53f9f7c7gwp6cvpj0x9isgwwrvpf3iw12nddc78jgsxggr769";
  };
in {
  services.hypridle = {
    settings = {
      general = {
        lock_cmd = "${lib.getExe' pkgs.procps "pidof"} hyprlock || ${lib.getExe pkgs.hyprlock}";
        unlock_cmd = "${lib.getExe' pkgs.procps "pkill"} -USR1 hyprlock";
      };
    };
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };
      background = [
        {
          monitor = "";
          path = "${wallpaper}";
          blur_passes = 2;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];
      input-field = [
        # {
        #   monitor = "";
        #   size = {
        #     width = 250;
        #     height = 60;
        #   };
        #   outer_color = "rgba(0,0,0,0)";
        #   inner_color = "rgba(0,0,0,0.5)";
        #   font_color = "rgb(255,255,255)";
        #   outline_thickness = 2;
        #   dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        #   dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
        #   dots_center = true;
        #   dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
        #   fade_on_empty = true;
        #   fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
        #   placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
        #   hide_input = false;
        #   rounding = -1; # -1 means complete rounding (circle/oval)
        #   check_color = "rgb(204, 136, 34)";
        #   fail_color = "rgb(204, 34, 34)"; # if authentication failed, changes outer_color and fail message color
        #   fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
        #   fail_transition = 300; # transition time in ms between normal outer_color and fail_color
        #   capslock_color = -1;
        #   numlock_color = -1;
        #   bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
        #   invert_numlock = false; # change color if numlock is off
        #   swap_font_color = false; # see below
        #   position = "0, -20";
        #   halign = "center";
        #   valign = "center";
        # }

        {
          # INPUT FIELD
          monitor = "";
          size = "300, 60";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgba(255, 255, 255, 0)";
          inner_color = "rgba(255, 255, 255, 0.1)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = true;
          fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
          font_family = "SF Pro Display Bold";
          placeholder_text = ''<i><span foreground="##ffffff99">Enter Pass</span></i>'';
          hide_input = false;
          position = "0, -250";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        # {
        #   monitor = "";
        #   text = osConfig.users.users.${config.home.username}.description;
        #   color = "rgba(200, 200, 200, 1.0)";
        #   font_size = 20;
        #   font_family = "Fira Semibold";
        #   position = "-100, 160";
        #   halign = "right";
        #   valign = "bottom";
        #   shadow_passes = 5;
        #   shadow_size = 10;
        # }
        # {
        #   monitor = "";
        #   text = ''
        #     cmd[update:1000] echo "<span>''$(${lib.getExe' pkgs.coreutils-full "date"} '+%-I:%M %p')</span>"
        #   '';
        #   color = "rgba(200, 200, 200, 1.0)";
        #   font_size = 55;
        #   font_family = "Fira Semibold";
        #   position = "-100, 70";
        #   halign = "right";
        #   valign = "bottom";
        #   shadow_passes = 5;
        #   shadow_size = 10;
        # }

        {
          # Time
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"'';
          color = "rgba(216, 222, 233, .7)";
          font_size = 160;
          font_family = "steelfish outline regular";
          position = " 0, 370";
          halign = "center";
          valign = "center";
        }
        {
          # Day-Month-Date
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = "rgba(216, 222, 233, .7)";
          font_size = 28;
          font_family = "SF Pro Display Bold";
          position = "0, 490";
          halign = "center";
          valign = "center";
        }
        {
          # USER
          monitor = "";
          text = osConfig.users.users.${config.home.username}.description;
          color = "rgba(216, 222, 233, 0.80)";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          font_size = 20;
          font_family = "SF Pro Display Bold";
          position = "0, 220";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
