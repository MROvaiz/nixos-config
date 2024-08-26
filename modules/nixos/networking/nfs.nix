{
  lib,
  config,
  ...
}: {
  services.nfs.server = lib.mkIf (config.networking.hostName == "nixbin") {
    enable = true;
    exports = ''
      /export/data    nixwork(ro,no_subtree_check) nixbin(ro,no_subtree_check) 10.147.17.67(ro,no_subtree_check) 10.147.17.231(ro,no_subtree_check)
    '';
  };
  fileSystems."/mnt/data" = lib.mkIf (config.networking.hostName == "nixwork") {
    device = "nixbin:/export/data/";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.after=network-online.target" "x-systemd.mount-timeout=90"];
  };
}
