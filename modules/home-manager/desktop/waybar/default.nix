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
  waybar_style = import ./style.nix {inherit (config) colorscheme;};
in {
  home.packages = with pkgs; [python39Packages.requests];
  programs.waybar = {
    enable = true;
    settings = waybar_config;
    style = waybar_style;
  };
}
