{pkgs, ...}: {
  # Lutris Setup
  environment.systemPackages = with pkgs; [
    # Lutris Setup
    (lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
        gamescope
        mangohud
      ];
      extraPkgs = pkgs: [
        # List package dependencies here
        wineWowPackages.stableFull
        libgudev
        libvdpau
        libsoup_2_4
        libusb1
        gamescope
        mangohud
      ];
    })
  ];
  environment.variables = {
    MESA_GL_VERSION_OVERRIDE = "4.5";
  };
}
