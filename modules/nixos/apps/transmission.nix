{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Torrent transmission.
    transmission
  ];
}
