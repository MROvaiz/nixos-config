{
  android = import ./android.nix;
  devenv = import ./devenv.nix;
  git = import ./git.nix;
  sops = import ./sops.nix;
  utils = import ./utils.nix;
}
