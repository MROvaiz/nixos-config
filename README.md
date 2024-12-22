# NixOS Configuration

This repository contains my personal NixOS configuration using the Flakes feature.

## System Overview

### Features
- Flake-based configuration
- Multiple host configurations (nixbin, etc)
- Hyprland as the window manager
- Home-manager integration
- Development tools and customizations

## Structure

```
.
├── flake.nix           # Flake configuration
├── flake.lock         
├── home-manager/       # Home-manager configurations
│   └── nixbin
├── modules/           # Modular configurations
│   ├── home-manager
│   └── nixos
├── nixos/            # System configurations
│   └── nixbin
├── overlays/         # Nix overlays
│   └── default.nix
├── pkgs/            # Custom packages
│   └── default.nix
└── secrets/         # Secret management
    └── secrets.yaml
```

## Usage

### Prerequisites
- NixOS installation media
- Git

### Installation

1. Clone this repository:
```bash
git clone https://github.com/MROvaiz/nixos-config.git
```

2. Install NixOS with this configuration:
```bash
nixos-install --flake ./#nixbin  # For nixbin host
```

Replace `nixbin` with your desired host.

### Update System

```bash
nix flake update
sudo nixos-rebuild switch --flake ./#nixbin  # For nixbin host
```

### Clean System

```bash
nix-collect-garbage -d  # Cleaning old configurations and Generations
```

## Acknowledgments

Based on [nix-starter-configs](https://github.com/Misterio77/nix-starter-configs) by Misterio77, standard version.