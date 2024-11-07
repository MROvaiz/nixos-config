{
  pkgs,
  config,
  ...
}: {
  services.caddy = {
    enable = true;
    email = "rahilovaiz@gmail.com";
    logFormat = "output file /var/log/caddy/error.log";
    package = pkgs.caddy-custom.override {
      externalPlugins = [
        {
          name = "duckdns";
          repo = "github.com/caddy-dns/duckdns";
          version = "v0.4.0";
        }
      ];
      vendorHash = "sha256-QBX4ljYFcK+/MQ9JDhsYBq639ZQMEuSDKVKKgVFnECE=";
    };
    virtualHosts = {
      # reverse_proxy is actual ip, which added in duckdns.
      # token is static token added.
      "jellyfin.mrovaiz.duckdns.org".extraConfig = ''
        reverse_proxy localhost:8096
        tls {
          dns duckdns $DUCKDNS_TOKEN {
            override_domain mrovaiz.duckdns.org
          }
        }
      '';
    };
  };
}
