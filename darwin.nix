{ pkgs, username, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Apply user-scope settings to account defined in username
  system.primaryUser = username;

  nix.enable = false;

  programs.zsh.enable = true;

  system.defaults = {
    dock.autohide = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 4;
}