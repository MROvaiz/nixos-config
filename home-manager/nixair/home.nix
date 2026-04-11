{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.apps.gimp
    outputs.homeManagerModules.apps.libreoffice
    outputs.homeManagerModules.apps.obsidian
    outputs.homeManagerModules.apps.vscode
  ];

  home = {
    username = "amf";
    homeDirectory = "/home/amf";
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
