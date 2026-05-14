{
  config,
  pkgs,
  ...
}: {
  # enable the netbird client daemon
  # ui.enable controls presence of netbird-ui wrapper (tray icon, GUI)
  # Testing speed between NetBird peers:
  #   1. Run iperf3 server on one device: iperf3 -s -p 5201
  #   2. Run iperf3 client on other device: iperf3 -c <peer-ip> -p 5201
  #   Peer IP found via: netbird status
  services.netbird = {
    enable = true;
    clients.wt0 = {
      login = {
        enable = true;
        setupKeyFile = config.sops.secrets.netbird_key.path;
      };
      ui.enable = true;
      port = 51821;
      openFirewall = true;
      openInternalFirewall = true;
    };
  };
}
