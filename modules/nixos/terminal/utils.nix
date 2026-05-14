{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Extra Utils
    ncdu
    fastfetch
    wget
    zip
    unzip
    unrar
    p7zip
    magic-wormhole
    ani-cli
    alejandra # Nix formatter
    nix-tree
    jq

    # notifications
    libnotify
  ];
}
