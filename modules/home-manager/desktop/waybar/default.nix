{
  pkgs,
  lib,
  config,
  osConfig,
  self,
  ...
}:
with lib; let
  waybar_config = import ./config.nix {inherit osConfig config lib pkgs;};
  waybar_style = import ./style.nix;
in {
  home.packages = with pkgs; [python312Packages.requests];
  programs.waybar = {
    enable = true;
    settings = waybar_config;
    style = waybar_style;
  };
}
