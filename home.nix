{ pkgs, ... }:

{
  home.username = "cooper";
  home.homeDirectory = "/Users/cooper";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;

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
  
      core.editor = "vim";
  
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

  home.file.".config/ghostty/config".text = ''
    font-size = 14
    font-family = JetBrains Mono
    window-padding-x = 10
    window-padding-y = 10
    macos-titlebar-style = tabs
    confirm-close-surface = false
    shell-integration-features = cursor,sudo,ssh-env,ssh-terminfo
  
    # Create and close tabs
    keybind = cmd+t=new_tab
    keybind = cmd+w=close_surface
  
    # Create splits
    keybind = cmd+d=new_split:right
    keybind = cmd+shift+d=new_split:down
  
    # Navigate splits 
    keybind = cmd+h=goto_split:left
    keybind = cmd+l=goto_split:right
    keybind = cmd+k=goto_split:up
    keybind = cmd+j=goto_split:down
  '';

  home.packages = with pkgs; [
    vim
    gnupg
  ];
}
