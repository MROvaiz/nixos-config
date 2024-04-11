{pkgs, ...}: {
  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  hardware.pulseaudio.enable = false;
  environment.systemPackages = with pkgs; [
    # Enable sound.
    pavucontrol
    pamixer
  ];
}
