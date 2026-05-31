{ pkgs, ... }:

{
  home.username = "cooper";
  home.homeDirectory = "/Users/cooper";

  home.stateVersion = "24.11";

  home.sessionVariables = {
    ANDROID_HOME = "$HOME/Library/Android/sdk";
    ANDROID_SDK_ROOT = "$HOME/Library/Android/sdk";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.sessionPath = [
    "$ANDROID_HOME/platform-tools"
    "$ANDROID_HOME/emulator"
    "$ANDROID_HOME/cmdline-tools/latest/bin" # Install Android SDK Cmd line tools in Android Studio settings
  ];

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;

    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nd = "nix develop -c $SHELL";
      vi = "nvim";
      vim = "nvim";

      "mobsf-run" = ''
        docker run -it --rm \
          -p 8000:8000 \
          opensecurity/mobile-security-framework-mobsf:latest
      '';
    };

    initContent = ''
      # Show nix shell indicator in prompt
      if [[ -n "$IN_NIX_SHELL" ]]; then
        PROMPT="(nix:$IN_NIX_SHELL) $PROMPT"
      fi
    '';

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" ];
    };
  };

  programs.git = {
    enable = true;
  
    settings = {
      user.name = "Cooper Simpson";
      user.email = "cooper@coopersimpson.com";
  
      core.editor = "nvim";
  
      alias = {
        st = "status";
        lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      };
    };
  
    signing = {
      key = "0EC9AF84BC2C1603";
      signByDefault = true;
    };
  };

  xdg.configFile = {
    "ghostty/config".source = ./ghostty/config;
    "nvim/init.lua".source = ./nvim/init.lua;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  home.packages = with pkgs; [
    neovim
    vim
    gnupg
    kotlin
    ghidra
  ];
}
