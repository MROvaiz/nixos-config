{pkgs, ...}: {
  home.packages = with pkgs; [
    # Image editor
    gimp
  ];
}
