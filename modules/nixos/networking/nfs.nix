{
  lib,
  config,
  ...
}: {
  services.nfs.server = lib.mkIf (config.networking.hostName == "nixbin") {
    enable = true;
    exports = ''
      /export         192.168.191.124(rw,fsid=0,no_subtree_check)
      /export/data    192.168.191.124(rw,nohide,insecure,no_subtree_check)
    '';
  };
  fileSystems."/mnt/data" = lib.mkIf (config.networking.hostName == "nixwork") {
    device = "192.168.191.67:/export/data/";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90"];
  };
}
