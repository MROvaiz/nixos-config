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

    # Apps
    outputs.nixosModules.apps.firefox
    outputs.nixosModules.apps.transmission

    # Desktop
    outputs.nixosModules.desktop.gdm
    outputs.nixosModules.desktop.gnome

    # Global
    outputs.nixosModules.global

    # Hardware
    outputs.nixosModules.hardware.mouse
    outputs.nixosModules.hardware.sound

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

    # Users
    outputs.nixosModules.users.mro

    # Hardware specific
    inputs.hardware.nixosModules.lenovo-thinkpad-t450s

    # Generated hardware config
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixwork";
  networking.networkmanager.enable = true;

  boot.loader = {
    efi = {
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      devices = ["nodev"];
      efiInstallAsRemovable = true;
      efiSupport = true;
      useOSProber = true;
      timeoutStyle = "hidden";
    };
  };

  home-manager = {
    users.mro = import "${inputs.self}/home-manager/${config.networking.hostName}/home.nix";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
