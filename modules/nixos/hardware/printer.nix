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
}
