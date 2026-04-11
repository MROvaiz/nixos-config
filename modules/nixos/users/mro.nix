{config, ...}: {
  users.users = {
    mro = {
      description = "MROvaiz";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINe8eLPdcy41bZoTVdy/59e0/rk/47739zbGUM0Jw9HG mro@nixbin"
      ];
      extraGroups = [
        "wheel"
        "libvirtd"
        "adbusers"
        "scanner"
        "lp"
        "incus-admin"
      ];
    };
  };
}
