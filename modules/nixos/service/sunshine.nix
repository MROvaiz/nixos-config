{pkgs, ...}: {
  services = {
    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
      package = pkgs.sunshine;
    };
  };
}
