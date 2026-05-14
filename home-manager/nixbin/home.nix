{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Apps
    outputs.homeManagerModules.apps.alacritty
    outputs.homeManagerModules.apps.discord
    outputs.homeManagerModules.apps.ghostty
    outputs.homeManagerModules.apps.gimp
    outputs.homeManagerModules.apps.kitty
    outputs.homeManagerModules.apps.kodi
    outputs.homeManagerModules.apps.libreoffice
    outputs.homeManagerModules.apps.obsidian
    outputs.homeManagerModules.apps.vscode

    # Desktop
    outputs.homeManagerModules.desktop.hyprland
    outputs.homeManagerModules.desktop.hyprlock
    outputs.homeManagerModules.desktop.rofi
    outputs.homeManagerModules.desktop.swaync
    outputs.homeManagerModules.desktop.themes
    outputs.homeManagerModules.desktop.waybar
    # outputs.homeManagerModules.desktop.quickshell

    # Services
    outputs.homeManagerModules.services.opencode
    outputs.homeManagerModules.services.sops

    # Settings
    outputs.homeManagerModules.settings.sound
    outputs.homeManagerModules.settings.virtmanager
  ];

  home = {
    username = "mro";
    homeDirectory = "/home/mro";
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    signing.format = null;
    settings.user = {
      name = "MROvaiz";
      email = "rahilovaiz@gmail.com";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
