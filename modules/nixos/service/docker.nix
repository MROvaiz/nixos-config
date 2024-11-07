{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
