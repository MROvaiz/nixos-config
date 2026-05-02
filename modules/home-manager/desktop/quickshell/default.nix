{
  lib,
  pkgs,
  inputs,
  ...
}: {
  xdg.configFile."quickshell" = {
    source = ./configs;
    recursive = true;
  };

  programs.quickshell = {
    enable = true;
    package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    systemd.enable = true;
  };
}
