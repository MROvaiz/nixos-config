{
  inputs,
  pkgs,
  ...
}: {
  # Gnome lock
  services.xserver.desktopManager.gnome.enable = true;
}
