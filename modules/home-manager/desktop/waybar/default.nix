{
  pkgs,
  lib,
  config,
  osConfig,
  self,
  inputs,
  ...
}:
with lib; let
  waybar_config = import ./config.nix {inherit osConfig config lib pkgs;};
  waybar_style = import ./style.nix;
  nixpkgs-stable-pkgs = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  programs.waybar = {
    enable = true;
    package = nixpkgs-stable-pkgs.waybar;
    settings = waybar_config;
    style = waybar_style;
  };
}
