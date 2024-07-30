{
  config,
  pkgs,
  ...
}: {
  # Enable DroidCam
  programs.droidcam.enable = true;

  # Virtual cam settings: see https://wiki.nixos.org/wiki/OBS_Studio#Using_the_Virtual_Camera
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  # Install OBS Studio with droidcam-obs
  users.users.mro = {
    packages = with pkgs; [
      # ...
      (wrapOBS {
        plugins = with obs-studio-plugins; [
          droidcam-obs
        ];
      })
      # ...
    ];
  };
}
