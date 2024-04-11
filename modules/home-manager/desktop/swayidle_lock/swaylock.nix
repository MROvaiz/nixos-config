{pkgs, ...}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      screenshots = true;
      clock = true;
      indicator = true;
      indicator-radius = 100;
      font = "Jost *";
      effect-blur = "7x5";
      color = "#121B35";
      grace = 2;
      fade-in = 0.2;
    };
  };
}
