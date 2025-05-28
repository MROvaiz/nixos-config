{pkgs, ...}: {
  virtualisation.docker = {
    enable = false;
    # liveRestore = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
