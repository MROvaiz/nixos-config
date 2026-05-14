{pkgs, ...}: {
  xdg.configFile."opencode/opencode.json" = {
    source = pkgs.writeText "opencode.json" (builtins.toJSON {
      "$schema" = "https://opencode.ai/config.json";
      theme = "opencode";
      autoupdate = true;
      model = "ollama/qwen3-coder:30b";
      provider = {
        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama";
          options = {
            baseURL = "http://127.0.0.1:11434/v1";
            apiKey = "ollama";
          };
          models = {
            "qwen3-coder:30b" = {
              name = "qwen3-coder 30B";
              tools = true;
              limit = {
                context = 200000;
                output = 8192;
              };
            };
            "gemma4:26b" = {
              name = "Gemma4 26B";
              tools = true;
              limit = {
                context = 200000;
                output = 8192;
              };
            };
            "gemma3:27b" = {
              name = "Gemma3 27B";
              tools = true;
              limit = {
                context = 200000;
                output = 8192;
              };
            };
            "devstral-small-2:24b" = {
              name = "devstral-small-2 24B";
              tools = true;
              limit = {
                context = 200000;
                output = 8192;
              };
            };
          };
        };
      };
    });
  };
}
