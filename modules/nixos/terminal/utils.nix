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
    magic-wormhole
    ani-cli
    # inputs.alejandra.defaultPackage.${system}
    alejandra # Nix formatter

    # screenshot
    inputs.hyprwm-contrib.packages.${system}.grimblast # Screenshots.
    grim
    slurp
    swappy

    # notifications
    dunst
    libnotify
  ];
}
