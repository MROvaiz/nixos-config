# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example
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

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  # nixpkgs = {
  #   # You can add overlays here
  #   overlays = [
  #     # Add overlays your own flake exports (from overlays and pkgs dir):
  #     outputs.overlays.additions
  #     outputs.overlays.modifications
  #     outputs.overlays.unstable-packages

  #     # You can also add overlays exported from other flakes:
  #     # neovim-nightly-overlay.overlays.default

  #     # Or define it inline, for example:
  #     # (final: prev: {
  #     #   hi = final.hello.overrideAttrs (oldAttrs: {
  #     #     patches = [ ./change-hello-to-hi.patch ];
  #     #   });
  #     # })
  #   ];
  #   # Configure your nixpkgs instance
  #   config = {
  #     # Disable if you don't want unfree packages
  #     allowUnfree = true;
  #   };
  # };

  # nix = let
  #   flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  # in {
  #   settings = {
  #     # Enable flakes and new 'nix' command
  #     experimental-features = "nix-command flakes";
  #     # Opinionated: disable global registry
  #     flake-registry = "";
  #     # Workaround for https://github.com/NixOS/nix/issues/9574
  #     nix-path = config.nix.nixPath;
  #     auto-optimise-store = true;
  #     # Substituters for little faster download
  #     substituters = [
  #       "https://nix-community.cachix.org"
  #       "https://fufexan.cachix.org"
  #       "https://hyprland.cachix.org"
  #     ];
  #     trusted-public-keys = [
  #       "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #       "fufexan.cachix.org-1:LwCDjCJNJQf5XD2BV+yamQIMZfcKWR9ISIFy5curUsY="
  #       "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  #     ];
  #   };
  #   # Opinionated: disable channels
  #   channel.enable = false;

  #   # Opinionated: make flake registry and nix path match flake inputs
  #   registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
  #   nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

  #   gc = {
  #     automatic = true;
  #     dates = "weekly";
  #     options = "--delete-older-than 10d";
  #   };
  # };
  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  networking.hostName = "nixair";

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  # boot.loader.systemd-boot.enable = true;
  # Implements Grub for EFI machines.
  boot.loader = {
    efi = {
      # canTouchEfiVariables = true;
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

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  # users.users = {
  #   # FIXME: Replace with your username
  #   amf = {
  #     # TODO: You can set an initial password for your user.
  #     # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
  #     # Be sure to change it (using passwd) after rebooting!
  #     description = "آيرا مهويش";
  #     initialPassword = "open";
  #     isNormalUser = true;
  #     openssh.authorizedKeys.keys = [
  #       # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
  #     ];
  #     # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
  #     extraGroups = [
  #       "wheel"
  #       "fuse"
  #       "libvirtd"
  #     ];
  #   };
  # };
  # programs.fuse.userAllowOther = true;
  # Set your time zone.
  # time.timeZone = "Asia/Kolkata";

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     # Forbid root login through SSH.
  #     PermitRootLogin = "no";
  #     # Use keys only. Remove if you want to SSH using password (not recommended)
  #     PasswordAuthentication = false;
  #   };
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
