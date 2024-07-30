{...}: {
  # Enable the DisplayManager sddm.
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
      };
    };
  };
}
