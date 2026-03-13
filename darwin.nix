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

  system.keyboard = {
    enableKeyMapping = true;
    swapLeftCommandAndLeftAlt = true; # Swap command and option keys
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 4;
}