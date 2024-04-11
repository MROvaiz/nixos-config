{pkgs, ...}: {
  programs.kodi = {
    enable = true;
    package = pkgs.kodi-wayland;
    sources = {
      video = {
        default = "movies";
        source = [
          {
            name = "4k";
            path = "/home/mro/gdrive/AJellyFin/4K";
            allowsharing = "true";
          }
          {
            name = "hd";
            path = "/home/mro/gdrive/AJellyFin/HD";
            allowsharing = "true";
          }
          {
            name = "movies";
            path = "/home/mro/gdrive/AJellyFin/Movies";
            allowsharing = "true";
          }
          {
            name = "tv show";
            path = "/home/mro/gdrive/AJellyFin/TV Show";
            allowsharing = "true";
          }
        ];
      };
    };
  };
}
