{pkgs, ...}: {
  # Wireguard app
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];
}
