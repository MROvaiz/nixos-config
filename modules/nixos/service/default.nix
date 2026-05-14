{
  caddy = import ./caddy.nix;
  docker = import ./docker.nix;
  flatpak = import ./flatpak.nix;
  immich = import ./immich.nix;
  incus = import ./incus.nix;
  jellyfin = import ./jellyfin.nix;
  ollama = import ./ollama.nix;
  sunshine = import ./sunshine.nix;
}
