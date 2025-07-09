{
  pkgs,
  lib,
  config,
  ...
}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
  services.caddy.virtualHosts = lib.mkIf (config.services.caddy.enable) {
    # "jellyfin.mrovaiz.duckdns.org".extraConfig = ''
    #   reverse_proxy localhost:8096
    #   tls {
    #     dns duckdns {file.${config.sops.secrets."duckdns/mrovaiz".path}} {
    #       override_domain mrovaiz.duckdns.org
    #     }
    #   }
    # '';
    "jellyfin.${config.networking.hostName}.duckdns.org".extraConfig = ''
      reverse_proxy localhost:8096
      tls {
        dns duckdns {file.${config.sops.secrets."duckdns/mrovaiz".path}} {
          override_domain ${config.networking.hostName}.duckdns.org
        }
      }
    '';
  };
}
