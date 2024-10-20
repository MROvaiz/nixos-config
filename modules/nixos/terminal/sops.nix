{
  config,
  inputs,
  pkgs,
  ...
}: {
  # Sops password manager Setup
  imports = [inputs.sops-nix.nixosModules.sops];
  environment.systemPackages = with pkgs; [
    sops
    age
  ];
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    age = {
      keyFile = "/home/mro/.config/sops/age/keys.txt";
      generateKey = true;
    };
    secrets.password = {};
  };
}
