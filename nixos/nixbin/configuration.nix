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
    outputs.nixosModules.apps.brave
    outputs.nixosModules.apps.firefox
    outputs.nixosModules.apps.nh
    outputs.nixosModules.apps.obs
    outputs.nixosModules.apps.opencode
    outputs.nixosModules.apps.openrgb
    outputs.nixosModules.apps.steam
    outputs.nixosModules.apps.surge-downloader
    outputs.nixosModules.apps.thunar
    outputs.nixosModules.apps.transmission
    outputs.nixosModules.apps.virtualisation
    outputs.nixosModules.apps.vlc
    outputs.nixosModules.apps.zoom

    # Desktop
    outputs.nixosModules.desktop.hyprland
    outputs.nixosModules.desktop.sddm

    # Global
    outputs.nixosModules.global

    # Hardware
    outputs.nixosModules.hardware.harddisk
    outputs.nixosModules.hardware.printer
    outputs.nixosModules.hardware.mouse
    outputs.nixosModules.hardware.sound
    outputs.nixosModules.hardware.video
    # outputs.nixosModules.hardware.vr

    # Monitoring
    outputs.nixosModules.monitoring.btop
    outputs.nixosModules.monitoring.iperf3
    outputs.nixosModules.monitoring.vnstat

    # Networking
    outputs.nixosModules.networking.bluetooth
    outputs.nixosModules.networking.internet
    outputs.nixosModules.networking.nfs
    outputs.nixosModules.networking.tailscale
    outputs.nixosModules.networking.wireguard

    # Services
    outputs.nixosModules.service.caddy
    outputs.nixosModules.service.incus
    outputs.nixosModules.service.jellyfin

    # Terminal
    outputs.nixosModules.terminal.android
    outputs.nixosModules.terminal.devenv
    outputs.nixosModules.terminal.git
    outputs.nixosModules.terminal.sops
    outputs.nixosModules.terminal.utils

    # Users
    outputs.nixosModules.users.mro

    # Hardware specific
    inputs.hardware.nixosModules.common-gpu-amd

    # Generated hardware config
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixbin";
  networking.networkmanager.enable = true;

  boot.loader = {
    timeout = 1;
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
