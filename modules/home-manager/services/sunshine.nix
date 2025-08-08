{pkgs, ...}: {
  home.packages = with pkgs; [
    (writers.writeBashBin "steam-sunshine-undo" ''
      capsh --delamb=cap_sys_admin -- -c "steam -shutdown" &> ~/.steam/steam-logs.txt
      sleep 2
    '')

    (writers.writeBashBin "steam-big-picture" ''
      sleep 2
      capsh --delamb=cap_sys_admin -- -c "setsid steam steam://open/bigpicture" &> ~/.steam/steam-logs.txt
    '')
  ];
  xdg.configFile."sunshine/apps.json".text = builtins.toJSON {
    env = {
      PATH = "$(PATH):$(HOME)/.local/bin";
    };
    apps = [
      {
        name = "Desktop";
        image-path = "desktop.png";
      }
      {
        name = "Low Res Desktop";
        image-path = "desktop.png";
        prep-cmd = [
          {
            do = "xrandr --output HDMI-1 --mode 1920x1080";
            undo = "xrandr --output HDMI-1 --mode 1920x1200";
          }
        ];
      }
      {
        name = "Steam Big Picture";
        image-path = "steam.png";
        auto-detach = "true";
        detached = ["steam-big-picture"];
        prep-cmd = [
          {
            do = "";
            undo = "steam-sunshine-undo";
          }
        ];
      }
    ];
  };
  xdg.configFile."sunshine/sunshine.conf".text = builtins.toJSON {
    vaapi_strict_rc_buffer = "enabled";
  };
}
