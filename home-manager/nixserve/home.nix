{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [];

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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
