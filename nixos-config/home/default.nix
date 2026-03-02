{ config, pkgs, ... }:

{

  imports = [
    ./common.nix
    ./programs.nix
    ./fcitx5
    ./zsh.nix
    ./git.nix
    ./vim.nix
    ./kitty.nix
    ./hyprland
  ];


  home = {
    username = "caigx";
    homeDirectory = "/home/caigx";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
