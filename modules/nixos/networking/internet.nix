{
  config,
  pkgs,
  ...
}: {
  # In /etc/nixos/configuration.nix
  systemd.services.NetworkManager-wait-online.enable = false;
}
