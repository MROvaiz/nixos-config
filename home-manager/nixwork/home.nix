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
    outputs.homeManagerModules.apps.obsidian
    outputs.homeManagerModules.apps.vscode
    outputs.homeManagerModules.apps.filezilla
    outputs.homeManagerModules.apps.insomnia
    outputs.homeManagerModules.apps.postman
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

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
