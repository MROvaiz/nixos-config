{pkgs, ...}: {
  # Enable Steam Game
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  hardware.steam-hardware.enable = true;
  environment.systemPackages = [
    pkgs.steam-run
  ];
}
