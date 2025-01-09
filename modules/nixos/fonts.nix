{pkgs, ...}: {
  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols

      # normal fonts
      jost
      lexend
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      roboto

      # nerdfonts
      # (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono" "JetBrainsMono"];})
      nerd-fonts.droid-sans-mono
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;
  };
}
