{pkgs, ...}: {
  home.packages = with pkgs; [
    # editor
    vscode
  ];
}
