{pkgs, ...}: let
  wallpaper = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/MROvaiz/wallpapers/main/cat-moon.jpg";
    sha256 = "1zchj4ahq8l206fgwcnlq89syxgpl9zi7437c1qzlc7jdlxychs1";
  };
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        wallpaper
      ];
      wallpaper = [
        ",${wallpaper}"
      ];
    };
  };
}
