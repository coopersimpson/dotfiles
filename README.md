# dotfiles
Uses [home-manager](https://github.com/nix-community/home-manager) for configuration of user specific (non-global) packages and dotfiles.

## Quick Install
First install nix on the system, use [nix-installer](https://github.com/DeterminateSystems/nix-installer).

### WSL
```sh
nix shell nixpkgs#home-manager --command sh -c "\
  git clone git@github.com:coopersimpson/dotfiles.git && \
  home-manager switch --flake ./dotfiles#cooper \
"
```

## Windows terminal theme
[TokyoNight](https://github.com/folke/tokyonight.nvim/blob/main/extras/windows_terminal/tokyonight_night.json) theme on windows terminal, using [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) with no ligatures.

## Keyboard setup
Use `MT(MOD_LCTL, KC_ESC)` in QMK/Via to remap caps lock such that a tap is ESC and holding uses left CTRL.
