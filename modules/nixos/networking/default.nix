{
  bluetooth = import ./bluetooth.nix;
  internet = import ./internet.nix;
  nfs = import ./nfs.nix;
  openvpn = import ./openvpn.nix;
  samba = import ./samba.nix; # draft
  tailscale = import ./tailscale.nix;
  wireguard = import ./wireguard.nix;
  zerotier = import ./zerotier.nix;
}
