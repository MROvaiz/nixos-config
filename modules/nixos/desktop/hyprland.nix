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
  security = {
    # allow wayland lockers to unlock the screen
    pam.services.swaylock.text = "auth include login";
  };
  # auto login for hyprland
  services = {
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "mro";
      defaultSession = "hyprland";
    };
  };
}
