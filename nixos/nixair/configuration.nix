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
    outputs.nixosModules.hardware.automout
    outputs.nixosModules.hardware.printer
    outputs.nixosModules.hardware.mouse
    outputs.nixosModules.hardware.sound

    # Monitoring
    outputs.nixosModules.monitoring.btop
    outputs.nixosModules.monitoring.vnstat

    # Terminal
    outputs.nixosModules.terminal.git

    # Users
    outputs.nixosModules.users.amf

    # Hardware specific
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop

    # Generated hardware config
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixair";
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
    users.amf = import "${inputs.self}/home-manager/${config.networking.hostName}/home.nix";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
