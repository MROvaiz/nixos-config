{
  config,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./config.nix
    ./hyprpaper.nix
    ./packages.nix
  ];
}
