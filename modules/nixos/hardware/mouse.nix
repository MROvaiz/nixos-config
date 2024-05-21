{pkgs, ...}: {
  # Mouse setting.
  services.libinput = {
    enable = true;

    # disabling mouse acceleration
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0";
    };

    # disabling touchpad acceleration
    touchpad = {
      accelProfile = "flat";
      accelSpeed = "0";
    };
  };
  environment.systemPackages = with pkgs; [
    libinput
  ];
}
