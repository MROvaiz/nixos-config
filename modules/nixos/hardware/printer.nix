{pkgs, ...}: {
  # Enable Printer.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
