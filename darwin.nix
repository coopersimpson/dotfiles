{ pkgs, username, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = username;

  # Set false because we use determinate-nix installer which manages Nix for us,
  # we don't want nix-darwin to do it.
  nix.enable = false;

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; # Uninstall unlisted brews/casks

    casks = [
      "ghostty"
      "fork"
      "obsidian"
      "visual-studio-code"
      "alfred" # Config needs to be imported manually
      "rectangle" # See config in repo, needs to be imported manually
      "codex"

      "google-chrome"
      "microsoft-edge"

      "discord"
      "slack"

      "spotify"
      "dropbox"
      "todoist-app"
      "protonvpn"
      "transmission"
      "betterdisplay"
    ];
  };

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      tilesize = 40;
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      FXPreferredViewStyle = "Nlsv";
    };

    NSGlobalDomain = {
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      ApplePressAndHoldEnabled = false;

      "com.apple.swipescrolldirection" = false;

      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        "com.apple.mouse.linear" = true; # Disable mouse acceleration
      };

      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          # Disable 'Cmd + Space' for Spotlight Search
          "64" = {
            enabled = false;
          };
          # Disable 'Cmd + Alt + Space' for Finder search window
          "65" = {
            enabled = false;
          };
        };
      };
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    swapLeftCommandAndLeftAlt = true; # Swap command and option keys
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 4;
}
