{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pkgs.surge-downloader
  ];
}
