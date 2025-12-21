{pkgs, ...}: {
  # Enable Firefox
  programs.firefox = {
    enable = true;
  };
  environment.systemPackages = [
    pkgs.vdhcoapp
  ];
}
