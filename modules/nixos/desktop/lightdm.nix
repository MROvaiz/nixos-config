{...}: {
  # Enable the DisplayManager.
  services = {
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "mro";
      defaultSession = "hyprland";
    };
    xserver = {
      enable = true;
      displayManager = {
        lightdm = {
          enable = true;
        };
      };
    };
  };
}
