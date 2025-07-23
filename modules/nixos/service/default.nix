{
  caddy = import ./caddy.nix;
  docker = import ./docker.nix;
  flatpak = import ./flatpak.nix;
  jellyfin = import ./jellyfin.nix;
  ollama = import ./ollama.nix;
  sunshine = import ./sunshine.nix;
}
