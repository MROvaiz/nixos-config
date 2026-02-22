{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  cfg = config.services.openclaw;
  nix-openclaw = inputs.nix-openclaw;
  discordSecretName = "openclaw/discord_bot";
  gatewayTokenName = "openclaw/gateway_token";
  openrouterSecretName = "openclaw/openrouter_api_key";
  envTemplateName = "openclaw-gateway.env";
  envFilePath = config.sops.templates.${envTemplateName}.path;
in {
  imports = [
    nix-openclaw.homeManagerModules.openclaw
  ];
  options.services.openclaw = {
    enable = lib.mkEnableOption "OpenClaw AI assistant gateway";
    allowedUsers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      example = ["123456789012345678"];
      description = "Discord user IDs allowed to DM the bot (allowlist).";
    };
    modelPrimary = lib.mkOption {
      type = lib.types.str;
      default = "openai-codex/gpt-5.2-codex";
      description = "Primary model id for agents.defaults.model.primary.";
    };
    modelFallbacks = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "openrouter/openai/gpt-oss-120b:free"
        "openrouter/upstage/solar-pro-3:free"
        "openrouter/z-ai/glm-4.5-air:free"
        "openrouter/qwen/qwen3-coder:free"
      ];
      description = "Fallback model list for agents.defaults.model.fallbacks.";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.openclaw = {
      enable = true;
      package = nix-openclaw.packages.${pkgs.system}.openclaw;
      documents = ./documents;
      config = {
        gateway = {
          mode = "local";
          auth.mode = "token";
          auth.token = "\${OPENCLAW_GATEWAY_TOKEN}";
        };
        agents.defaults.model.primary = cfg.modelPrimary;
        agents.defaults.model.fallbacks = cfg.modelFallbacks;
        # Ensure images work even if primary model is text-only.
        agents.defaults.imageModel.primary = "openrouter/google/gemma-3-27b-it:free";
        agents.defaults.imageModel.fallbacks = ["openrouter/openrouter/free"];
        # Restrict tools when running on OpenRouter fallbacks.
        # (Codex primary stays fully capable.)
        tools.byProvider.openrouter = {
          profile = "minimal";
          deny = [
            "group:web"
            "browser"
            "canvas"
            "group:fs"
            "group:runtime"
            "group:nodes"
            "gateway"
            "cron"
          ];
        };
        tools.web.search.enabled = true;
        tools.web.fetch.enabled = true;
        channels.discord = {
          enabled = true;
          allowBots = false;
          dm = {
            enabled = true;
            policy = "allowlist";
            allowFrom = cfg.allowedUsers;
          };
        };
      };
    };
    # Fix HM activation failure: "Existing file ... would be clobbered"
    home.file.".openclaw/openclaw.json".force = true;
    home.file.".openclaw/.env" = {
      source = config.lib.file.mkOutOfStoreSymlink envFilePath;
      force = true;
    };
    # Lock down OpenClaw state dir perms (doctor warning).
    systemd.user.tmpfiles.rules = [
      "d %h/.openclaw 0700 - - -"
      "d %h/.openclaw/agents 0700 - - -"
      "d %h/.openclaw/workspace 0700 - - -"
    ];
    # Secret injection for systemd: template -> EnvironmentFile.
    sops.templates.${envTemplateName} = {
      mode = "0400";
      content = ''
        DISCORD_BOT_TOKEN=${config.sops.placeholder.${discordSecretName}}
        OPENCLAW_GATEWAY_TOKEN=${config.sops.placeholder.${gatewayTokenName}}
        OPENROUTER_API_KEY=${config.sops.placeholder.${openrouterSecretName}}
      '';
    };
    # Attach env file to the nix-openclaw generated user service.
    systemd.user.services."openclaw-gateway".Service.EnvironmentFile = [envFilePath];
  };
}
