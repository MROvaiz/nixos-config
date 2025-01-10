{pkgs, ...}: {
  home.packages = with pkgs; [
    # Libre Office
    libreoffice
  ];
}
