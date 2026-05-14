{
  pkgs,
  config,
  ...
}: {
  services = {
    ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      openFirewall = true;
      environmentVariables = {
        OLLAMA_CONTEXT_LENGTH = "200000";
        OLLAMA_MAX_LOADED_MODELS = "1";
        OLLAMA_NUM_PARALLEL = "1";
      };

      loadModels = [
        "qwen3-coder:30b"
        "gemma4:26b"
        "gemma3:27b"
        "devstral-small-2:24b"
      ];

      # https://github.com/NixOS/nixpkgs/issues/308206
      # https://rocm.docs.amd.com/en/latest/reference/gpu-arch-specs.html
      rocmOverrideGfx = "11.0.1"; # gfx1101
    };

    # open-webui = {
    #   enable = true;
    # };
    # nextjs-ollama-llm-ui = {
    #   enable = true;
    #   port = 8080;
    #   ollamaUrl = "http://127.0.0.1:11434";
    # };
  };
}
