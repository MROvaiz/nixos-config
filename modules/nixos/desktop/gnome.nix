{
  inputs,
  pkgs,
  ...
}: {
  # Gnome lock
  services.desktopManager.gnome.enable = true;
}
