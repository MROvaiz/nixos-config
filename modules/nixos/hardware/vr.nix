{
  pkgs,
  config,
  ...
}: {
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };
}
