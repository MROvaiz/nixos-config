{
  pkgs,
  lib,
  config,
  ...
}: {
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    openFirewall = true;
    mediaLocation = "/var/lib/immich";
    accelerationDevices = ["/dev/dri/renderD128"];
    machine-learning.enable = true;
  };

  users.users.immich.extraGroups = ["video" "render"];
  # immich-go upload from-google-photos --server=http://localhost:2283 --api-key=key ./takeout-*.zip
  environment.systemPackages = with pkgs; [
    immich-go
  ];

  services.caddy.virtualHosts = lib.mkIf (config.services.caddy.enable && config ? sops && config.sops.secrets ? "duckdns/mrovaiz") {
    "immich.${config.networking.hostName}.duckdns.org".extraConfig = ''
      reverse_proxy localhost:2283
      tls {
        dns duckdns {file.${config.sops.secrets."duckdns/mrovaiz".path}} {
          override_domain ${config.networking.hostName}.duckdns.org
        }
      }
    '';
  };
}
