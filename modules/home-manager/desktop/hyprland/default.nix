{
  config,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./config.nix
    ./packages.nix
  ];
}
