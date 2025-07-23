{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Extra Utils
    ncdu
    neofetch
    wget
    zip
    unzip
    unrar
    p7zip
    magic-wormhole
    ani-cli
    alejandra # Nix formatter

    # notifications
    libnotify
  ];
}
