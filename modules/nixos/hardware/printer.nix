{
  pkgs,
  lib,
  ...
}: {
  # Enable Printer.
  services.printing = {
    enable = true;
    drivers = [pkgs.epson-201401w];
  };
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [pkgs.utsushi];
  services.udev.packages = [pkgs.utsushi];
  environment.systemPackages = with pkgs; [
    imagemagick
    ghostscript
    libtiff
    sane-frontends
  ];
}
