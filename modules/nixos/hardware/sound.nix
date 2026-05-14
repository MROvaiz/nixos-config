{pkgs, ...}: {
  # Enable sound.
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      extraLadspaPackages = [pkgs.rnnoise-plugin];
    };
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    pamixer
    rnnoise-plugin
  ];
}
