{
  config,
  pkgs,
  ...
}: {
  # enable the iperf3 service
  services.iperf3 = {
    enable = true;
    openFirewall = true;
    verbose = true;
  };
  environment.systemPackages = with pkgs; [
    iperf
  ];
}
