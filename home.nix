{ pkgs, ... }:

{
  home.username = "cooper";
  home.homeDirectory = "/Users/cooper";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
  programs.zsh.enable = true;

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

  home.packages = with pkgs; [
    vim
    gnupg
  ];
}