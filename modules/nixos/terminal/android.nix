{pkgs, ...}: {
  # android tools
  programs.adb.enable = true;
  environment.systemPackages = [
    pkgs.pmbootstrap
  ];
}
