{...}: {
  # Enable the DisplayManager.
  services = {
    xserver = {
      enable = true;
      displayManager = {
        autoLogin.enable = true;
        autoLogin.user = "mro";
        defaultSession = "hyprland";
        lightdm = {
          enable = true;
        };
      };
    };
  };
}
