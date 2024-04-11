# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here

  # Apps
  apps = import ./apps;

  # Desktop
  desktop = import ./desktop;

  # Services
  services = import ./services;

  # Settings
  settings = import ./settings;
}
