{
  pkgs,
  lib,
  ...
}:
{
  # Required: Enable nftables for Incus networking
  # Incus on NixOS requires nftables; iptables will fail
  networking.nftables.enable = true;

  # Enable Incus with LTS variant and UI
  virtualisation.incus = {
    enable = true;
    package = pkgs.incus-lts;
    ui.enable = true;

    # Preseed configuration - declarative initialization
    # This creates networks, storage pools, and profiles on first boot
    preseed = {
      # Daemon settings
      config = {
        # Allow remote API access from any interface
        "core.https_address" = "0.0.0.0:8443";
        # Auto-update images every 24 hours
        "images.auto_update_interval" = 24;
      };

      # Networks - NAT bridge for containers/VMs
      networks = [
        {
          name = "incusbr0";
          type = "bridge";
          description = "NAT bridge for instances";
          config = {
            "ipv4.address" = "auto";
            "ipv4.nat" = "true";
            "ipv6.address" = "none";
          };
        }
      ];

      # Storage pools - directory backend
      # Simple storage backend requiring no special setup
      # For ZFS or LVM, change driver and add config.source
      storage_pools = [
        {
          name = "default";
          driver = "dir";
          config = {};
        }
      ];

      # Profiles - default profile for instances
      # Automatically applies network and storage to new containers/VMs
      profiles = [
        {
          name = "default";
          description = "Default Incus profile";
          config = {
            # Security: isolated ID mapping for containers
            "security.idmap.isolated" = "true";
          };
          devices = {
            eth0 = {
              name = "eth0";
              network = "incusbr0";
              type = "nic";
            };
            root = {
              path = "/";
              pool = "default";
              type = "disk";
            };
          };
        }
      ];
    };
  };

  # Allow Incus bridge through firewall for DHCP/DNS
  # This enables instances to get IP addresses via DHCP
  networking.firewall.trustedInterfaces = ["incusbr0"];
}
