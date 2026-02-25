{
  config,
  inputs,
  pkgs,
  ...
}: {
  # Sops password manager Setup
  imports = [
    # sops-nix home-manager module
    inputs.sops-nix.homeManagerModules.sops
  ];
  sops = {
    # TODO: use json format, search json formatter in nano
    defaultSopsFile = "${inputs.self}/secrets/secrets.json";
    # defaultSopsFile = "${inputs.self}/secrets/secrets.yaml";
    age = {
      keyFile = "/home/mro/.config/sops/age/keys.txt";
    };
    secrets = {
      "openclaw/discord_bot" = {};
      "openclaw/gateway_token" = {};
      "openclaw/openrouter_api_key" = {};
    };
  };
}
