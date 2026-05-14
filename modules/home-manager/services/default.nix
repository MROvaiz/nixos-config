{
  rclone = import ./rclone.nix; # Disabled
  sunshine = import ./sunshine.nix;
  openclaw = import ./openclaw.nix;
  opencode = import ./opencode.nix;
  sops = import ./sops.nix;
}
