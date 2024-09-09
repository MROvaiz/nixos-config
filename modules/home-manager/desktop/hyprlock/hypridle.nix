{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
      };
      listener = [
        {
          timeout = 600;
          on-timeout = "hyprlock";
        }
        # {
        #   timeout = 660;
        #   on-timeout = "systemctl suspend";
        # }
      ];
    };
  };
}
