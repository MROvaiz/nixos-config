{
  pkgs,
  config,
  ...
}: {
  services = {
    ollama = {
      enable = true;
      acceleration = "rocm";
      openFirewall = true;

      loadModels = [
        "deepseek-r1:1.5b"
        # "deepseek-r1:14b"
        # "deepseek-coder-v2"
      ];

      # https://github.com/NixOS/nixpkgs/issues/308206
      # https://rocm.docs.amd.com/en/latest/reference/gpu-arch-specs.html
      rocmOverrideGfx = "11.0.1"; # gfx1101
    };

    open-webui = {
      enable = true;
    };
    # nextjs-ollama-llm-ui = {
    #   enable = true;
    #   port = 8080;
    #   ollamaUrl = "http://127.0.0.1:11434";
    # };
  };
}
