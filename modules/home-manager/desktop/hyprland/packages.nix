{
  config,
  pkgs,
  self,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # utils and misc
    wf-recorder
    wl-clipboard
    wlogout
    hyprpicker
    wlsunset
    tree

    # screenshot
    inputs.hyprwm-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast
    grim
    slurp
    swappy
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XCURSOR_SIZE = "18";
    GDK_BACKEND = "wayland,x11";
    #SDL_VIDEODRIVER = "x11";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
