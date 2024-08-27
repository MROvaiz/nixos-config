{pkgs, ...}: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy-custom.override {
      externalPlugins = [
        {
          name = "duckdns";
          repo = "github.com/caddy-dns/duckdns";
          version = "v0.4.0";
        }
      ];
      vendorHash = "sha256-UBn/jQIoi9yq3ZLd+LvDM7PUE0kqP0GKTU+oQIdHztw=";
    };
    virtualHosts."jellyfin.sample1.duckdns.org".extraConfig = ''
      reverse_proxy http://localhost:8096
      tls {
        dns duckdns $DUCKDNS_TOKEN {
          override_domain sample1.duckdns.org
        }
      }
    '';
  };
}
