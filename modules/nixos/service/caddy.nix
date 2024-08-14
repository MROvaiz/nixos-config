{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [80 443];
  services.caddy = {
    enable = true;
    virtualHosts = {
      "jellyfin.sample1.duckdns.org".extraConfig = ''
        reverse_proxy localhost:8096
        tls {
          dns duckdns $DUCKDNS_TOKEN
          resolvers 1.1.1.1
        }
      '';
    };
  };
}
