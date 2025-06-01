{
  config,
  pkgs,
  ...
}: {
  # make the netbird command usable to users
  # environment.systemPackages = [pkgs.netbird];

  # enable the netbird service
  services.netbird.enable = true;
}
