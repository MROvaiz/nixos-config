{pkgs, ...}: {
  services.transmission = {
    enable = true;
    package = pkgs.transmission_4-gtk;
    openFirewall = true;
    openRPCPort = true;
    webHome = pkgs.flood-for-transmission;
  };
}
