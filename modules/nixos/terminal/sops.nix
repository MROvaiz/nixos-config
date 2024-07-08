{
  config,
  inputs,
  pkgs,
  ...
}: {
  # devenvironment Setup
  imports = [inputs.sops-nix.nixosModules.sops];
  environment.systemPackages = with pkgs; [
    sops
    age
  ];
  # This will add secrets.yml to the nix store
  # You can avoid this by adding a string to the full path instead, i.e.
  # sops.defaultSopsFile = "/root/.sops/secrets/example.yaml";
  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
  # This will automatically import SSH keys as age keys
  # sops.age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/home/mro/.config/sops/age/keys.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = true;
  # This is the actual specification of the secrets.
  sops.secrets."openvpn/username" = {
    mode = "0440";
    owner = config.users.users.mro.name;
    group = config.users.users.mro.group;
  };
  sops.secrets."openvpn/password" = {
    mode = "0440";
    owner = config.users.users.mro.name;
    group = config.users.users.mro.group;
  };
}
