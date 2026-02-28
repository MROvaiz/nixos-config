# NixOS Configuration Guide

## Table of Contents
1. [Finding Best Configs Online](#1-finding-best-configs-online)
2. [Debugging and Fixing Problems](#2-debugging-and-fixing-problems)
3. [What We Did So Far](#3-what-we-did-so-far)

---

## 1. Finding Best Configs Online

### Best Places to Search

| Resource | URL | Description |
|----------|-----|-------------|
| GitHub Search | https://github.com/search?q=NixOS+configuration&type=repositories | Search for "NixOS flake configuration" |
| NixOS Wiki | https://nixos.wiki/wiki/Configuration_Collection | Community configurations |
| r/NixOS | https://reddit.com/r/NixOS | Community discussions |
| Awesome Nix | https://github.com/nicknovitski/awesome-nix | Curated list |

### Popular Configs to Study

Based on research, these are well-regarded:

| Config | Stars | Focus |
|--------|-------|-------|
| [colemickens/nixos-flake-example](https://github.com/colemickens/nixos-flake-example) | 180 | Simple, minimal example |
| [tsandrini/practical-flakes-template](https://github.com/tsandrini/practical-flakes-template) | 460+ | Modular, opinionated |
| [mnixry/nixos-config](https://github.com/mnixry/nixos-config) | 6 | Clean, modern |
| [StanAngeloff/nix-meridian](https://github.com/stanangeloff/nix-meridian) | 1 | Full system + home |

### Key Search Terms

```
# GitHub search queries
nixos flake configuration nix
nixos home-manager flake
nixos hyprland wayland flake
```

### What to Look For in a Good Config

1. **Simple Structure**
   ```
   .
   ├── flake.nix              # Main flake file
   ├── nixos/                 # Host configurations
   │   ├── hostname1/
   │   │   └── configuration.nix
   │   └── hostname2/
   │       └── configuration.nix
   ├── home/                  # Home Manager configs (optional)
   ├── modules/               # Custom modules (if needed)
   └── overlays/              # Package overlays
   ```

2. **Standard Pattern in flake.nix**:
   ```nix
   {
     inputs = {
       nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
       home-manager.url = "github:nix-community/home-manager";
     };
     
     outputs = { self, nixpkgs, home-manager, ... }@inputs: {
       nixosConfigurations = {
         hostname = nixpkgs.lib.nixosSystem {
           specialArgs = { inherit inputs; };
           modules = [ ./nixos/hostname ];
         };
       };
     };
   }
   ```

3. **Avoid Over-Engineering**
   - Don't create custom modules unless reusing across hosts
   - Keep host configs self-contained
   - Use nixpkgs/home-manager options directly when possible

---

## 2. Debugging and Fixing Problems

### Common Error Types

#### a) Syntax Errors
```bash
# Check syntax without building
nix-instantiate --parse flake.nix
nix-instantiate --parse nixos/hostname/configuration.nix
```

#### b) Module Option Conflicts
**Problem**: `attribute 'config' already defined`
```nix
# BAD - Multiple config blocks
config = mkIf condition { ... };
config = mkIf otherCondition { ... };  # ERROR!

# GOOD - Use mkMerge
config = mkMerge [
  (mkIf condition { ... })
  (mkIf otherCondition { ... })
];
```

#### c) Option Path Conflicts
**Problem**: `option 'X' would be a parent but its type doesn't support nested options`
```nix
# BAD - Creating option under wrong path
options.networking = {           # networking is already a NixOS option!
  networkmanager = mkEnableOption "NM";
};

# GOOD - Use correct option path
options.networking.networkmanager = {
  enable = mkEnableOption "NM";
};
```

#### d) Infinite Recursion
**Problem**: `infinite recursion encountered`
- Usually caused by referencing `config` in `imports`
- Don't use `outputs.nixosModules` in host configs - pass via `specialArgs`

#### e) Undefined Variables
**Problem**: `undefined variable 'inputs'`
- Pass inputs through `specialArgs` in flake.nix
- Don't reference variables outside their scope

### Debugging Workflow

```bash
# 1. Check flake evaluates
nix flake show

# 2. Check specific file syntax
nix-instantiate --parse path/to/file.nix

# 3. Dry build (no switching)
nixos-rebuild dry-build --flake ./#hostname

# 4. Get full error trace
nixos-rebuild build --flake ./#hostname --show-trace 2>&1 | tail -50

# 5. Check specific module
nix --extra-experimental-features 'nix-command flakes' \
  eval --file flake.nix --apply 'x: x.nixosModules.moduleName'
```

### Quick Fixes Reference

| Issue | Fix |
|-------|-----|
| Multiple `config =` | Use `mkMerge` |
| Wrong option path | Check nixpkgs option path first |
| `inputs` not defined | Add to `specialArgs` in flake.nix |
| `outputs` not available | Pass as `specialArgs` or import modules differently |
| `nixosSystem` missing | Import from nixpkgs.lib |
| Host platform not set | Add `nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";` |

---

## 3. What We Did So Far

### Session Summary

We audited and attempted to improve your NixOS configuration.

#### Phase 1: Initial Analysis
- Found your existing config at `~/github/mrovaiz/nixos-config`
- Identified structure: 4 hosts (nixbin, nixserve, nixwork, nixair)
- Config uses: Flakes, Home Manager, SOPS-Nix, Hyprland

#### Phase 2: Attempted New Config (Abandoned)
- Created new complex config at `~/github/mrovaiz/nixos-config-new/`
- Built 70+ custom modules (over-engineered)
- Ran into numerous issues:
  - Module option path conflicts
  - Multiple `config =` definitions
  - Variable scoping issues
  - Infinite recursion errors

**Why it failed**: The approach was too complex. Creating custom modules for everything when nixpkgs/home-manager already provide them.

#### Phase 3: Discovered Existing Config Works
- Your existing config at `~/github/mrovaiz/nixos-config` **already works**
- It follows best practices:
  - Simple flake.nix
  - Per-host configuration.nix files
  - Uses standard nixpkgs/home-manager options

### Your Current Config Structure

```
~/github/mrovaiz/nixos-config/
├── flake.nix                 # Main flake - WORKS
├── flake.lock
├── .sops.yaml
├── secrets/
│   └── secrets.yaml
├── overlays/
│   └── default.nix
├── pkgs/
│   └── default.nix
├── shell.nix
├── modules/
│   ├── nixos/               # Custom modules (optional)
│   └── home-manager/        # Custom HM modules (optional)
└── nixos/
    ├── nixbin/
    │   ├── configuration.nix
    │   └── hardware-configuration.nix
    ├── nixserve/
    │   ├── configuration.nix
    │   └── hardware-configuration.nix
    ├── nixwork/
    │   ├── configuration.nix
    │   └── hardware-configuration.nix
    └── nixair/
        ├── configuration.nix
        └── hardware-configuration.nix
```

### Testing Your Config

```bash
cd ~/github/mrovaiz/nixos-config

# Test build (dry-run)
nixos-rebuild dry-build --flake ./#nixbin

# Test all hosts
nixos-rebuild dry-build --flake ./#nixserve
nixos-rebuild dry-build --flake ./#nixwork
nixos-rebuild dry-build --flake ./#nixair

# Format code
nix fmt

# Apply changes (when ready)
sudo nixos-rebuild switch --flake ./#nixbin
```

### Recommendation

**Keep your existing config**. It's well-structured and works. The "new" complex config we attempted to create was unnecessary over-engineering.

If you want to add new features:
1. Find the option in nixpkgs/home-manager docs
2. Add directly to host's configuration.nix
3. Only create a module if reusing across 3+ hosts

---

## Quick Reference Commands

```bash
# Build
nixos-rebuild build --flake ./#hostname
nixos-rebuild switch --flake ./#hostname

# Test without building
nixos-rebuild dry-build --flake ./#hostname
nixos-rebuild dry-run --flake ./#hostname

# Update
nix flake update
sudo nixos-rebuild switch --flake ./#hostname --upgrade

# Cleanup
nix-collect-garbage -d
nh clean all

# Format
nix fmt
```
