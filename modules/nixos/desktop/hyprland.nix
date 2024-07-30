{
  inputs,
  pkgs,
  ...
}: {
  # Get Latest git version for hyprland
  imports = [
    inputs.hyprland.nixosModules.default
  ];
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  security.pam.services.hyprlock = {};
  # auto login for hyprland
  services = {
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "mro";
      defaultSession = "hyprland";
    };
  };
}
