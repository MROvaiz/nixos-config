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
    # TODO: use json format, search json formatter in nano
    defaultSopsFile = "${inputs.self}/secrets/secrets.json";
    # defaultSopsFile = "${inputs.self}/secrets/secrets.yaml";
    age = {
      keyFile = "/home/mro/.config/sops/age/keys.txt";
      generateKey = true;
    };
    secrets = {
      password = {};
      "duckdns/mrovaiz" = {owner = "caddy";};
    };
  };
}
