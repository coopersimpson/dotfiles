# dotfiles
Declarative macOS configuration using Nix, nix-darwin, and Home Manager.

Uses [nix-darwin](https://github.com/nix-darwin/nix-darwin) to manage macOS system configuration and system-wide packages declaratively.

Uses [Home Manager](https://github.com/nix-community/home-manager) to manage user-specific packages, shell configuration, and dotfiles.

## Quick setup
- Install nix on the system, use [nix-installer](https://github.com/DeterminateSystems/nix-installer)
- Clone this repo
- Apply the configuration `sudo nix run nix-darwin -- switch --flake .#Coopers-Mac-mini`
- Rebuild after modifying configuration files using `sudo darwin-rebuild switch --flake .#Coopers-Mac-mini`

## Keyboard setup
Use `MT(MOD_LCTL, KC_ESC)` in QMK/Via to remap caps lock such that a tap is ESC and holding uses left CTRL.