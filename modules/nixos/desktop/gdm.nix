{...}: {
  # Enable the DisplayManager GDM for gnome.
  services = {
    xserver = {
      enable = true;
      displayManager = {gdm = {enable = true;};};
    };
  };
}
