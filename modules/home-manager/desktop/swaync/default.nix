{pkgs, ...}: {
  services.swaync = {
    enable = true;
    settings = {
      cssPriority = "user";
    };
  };
}
