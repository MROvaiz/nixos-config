{pkgs, ...}: {
  home.packages = with pkgs; [
    # terminal emulator
    alacritty
  ];
}
