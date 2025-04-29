{
  pkgs,
  config,
  ...
}: {
  services.caddy = {
    enable = true;
    email = "rahilovaiz@gmail.com";
    logFormat = "output file /var/log/caddy/error.log";
    # package = pkgs.caddy-custom.override {
    #   externalPlugins = [
    #     {
    #       name = "duckdns";
    #       repo = "github.com/caddy-dns/duckdns";
    #       version = "v0.4.0";
    #     }
    #   ];
    #   vendorHash = "sha256-QBX4ljYFcK+/MQ9JDhsYBq639ZQMEuSDKVKKgVFnECE=";
    # };
    package = pkgs.caddy.withPlugins {
      plugins = ["github.com/caddy-dns/duckdns@v0.4.0"];
      hash = "sha256-9vUR5sL5nkTgzSxYEv2KatrAidmTQMGyHcrrHv6b+cE=";
    };
    # virtualHosts = {
    #   # reverse_proxy is actual ip, which added in duckdns.
    #   # token is static token added.
    #   "jellyfin.mrovaiz.duckdns.org".extraConfig = ''
    #     reverse_proxy localhost:8096
    #     tls {
    #       dns duckdns {file.${config.sops.secrets."duckdns/mrovaiz".path}} {
    #         override_domain mrovaiz.duckdns.org
    #       }
    #     }
    #   '';
    # };
  };
}
