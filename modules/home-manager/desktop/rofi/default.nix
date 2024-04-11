{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
    ];
    # Get Themes from https://github.com/adi1090x/rofi
    # copy all @import in one file
    theme = ./rofi-theme.rasi;
    # you can also use configuration in file, anything can be used.
    extraConfig = {
      modi = "drun,run,filebrowser,window";
      show-icons = true;
      display-drun = "";
      display-run = "";
      display-filebrowser = "";
      display-window = "";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
    };
  };
}
