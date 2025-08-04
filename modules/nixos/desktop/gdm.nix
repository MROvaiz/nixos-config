{...}: {
  # Enable the DisplayManager GDM for gnome.
  services = {
    displayManager = {gdm = {enable = true;};};
  };
}
