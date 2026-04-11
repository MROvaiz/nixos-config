{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.nixosModules.clipboard
    outputs.nixosModules.fonts

    # Global
    outputs.nixosModules.global

    # Monitoring
    outputs.nixosModules.monitoring.btop
    outputs.nixosModules.monitoring.iperf3
    outputs.nixosModules.monitoring.vnstat

    # Networking
    outputs.nixosModules.networking.nfs
    outputs.nixosModules.networking.tailscale

    # Services
    outputs.nixosModules.service.caddy
    outputs.nixosModules.service.jellyfin

    # Terminal
    outputs.nixosModules.terminal.devenv
    outputs.nixosModules.terminal.git
    outputs.nixosModules.terminal.sops
    outputs.nixosModules.terminal.utils

    # Users
    outputs.nixosModules.users.mro

    # Hardware specific
    inputs.hardware.nixosModules.lenovo-thinkpad-t450s

    # Generated hardware config
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixserve";
  networking.networkmanager.enable = true;

  boot.loader = {
    grub = {
      enable = true;
      devices = ["/dev/vda"];
      useOSProber = true;
    };
  };

  home-manager = {
    users.mro = import "${inputs.self}/home-manager/${config.networking.hostName}/home.nix";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
