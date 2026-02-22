{
  bluetooth = import ./bluetooth.nix;
  internet = import ./internet.nix;
  netbird = import ./netbird.nix;
  nfs = import ./nfs.nix;
  samba = import ./samba.nix; # draft
  tailscale = import ./tailscale.nix;
  wireguard = import ./wireguard.nix;
  zerotier = import ./zerotier.nix;
}
