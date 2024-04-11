{pkgs, ...}: {
  home.packages = with pkgs; [
    # editor
    kitty
  ];
}
