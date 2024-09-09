{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
