# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here

  # Uncategorized
  clipboard = import ./clipboard.nix;
  fonts = import ./fonts.nix;

  # Apps
  apps = import ./apps;

  # Desktop
  desktop = import ./desktop;

  # Development
  development = import ./development;

  # global
  global = import ./global;

  # Hardware
  hardware = import ./hardware;

  # Monitoring
  monitoring = import ./monitoring;

  # Networking
  networking = import ./networking;

  # Service
  service = import ./service;

  # Terminal
  terminal = import ./terminal;

  # Users
  users = import ./users;
}
