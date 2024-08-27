{pkgs, ...}: {
  services.caddy = {
    package = pkgs.caddy-custom.override {
      externalPlugins = [
        {
          name = "duckdns";
          repo = "github.com/caddy-dns/duckdns";
          version = "v0.4.0";
        }
      ];
      vendorHash = "sha256-7cRI65foALEsfYhvdGresq7oma/cIsnVtbq+Gan5DCU=";
    };
    virtualHosts."example.org:80".extraConfig = ''
      respond "Hello, world!"
      tls internal
    '';
  };
}
