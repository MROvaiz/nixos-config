{pkgs, ...}: {
  home.packages = with pkgs; [
    # server connect file transfer
    filezilla
  ];
}
