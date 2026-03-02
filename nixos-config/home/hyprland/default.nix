{ config, pkgs, noctalia-shell, ...}: let 
  hyprPath = "${config.home.homeDirectory}/nixos-config/home/hyprland/hypr";
  waybarPath = "${config.home.homeDirectory}/nixos-config/home/waybar";
  rofiPath = "${config.home.homeDirectory}/nixos-config/home/rofi";
  noctaliaConfigFile = "${config.home.homeDirectory}/nixos-config/home/noctalia-settings.json";
in {

  home.packages = with pkgs;[
    #hyprpaper
    #hyprlock
    #hypridle
    #rofi
    #waybar
    #wlogout
    #使用noctalia-shell时，就不用上面这些
    #dunst
    noctalia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
    libnotify
    wl-clipboard
    cliphist
    cava
    udiskie
    kdePackages.dolphin
    grim
    wf-recorder
    slurp
    nwg-look
    wev #key board:get key's value
  ];

  home.pointerCursor = {
    size = 24;       # 鼠标大小
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
  };


  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink hyprPath;
  home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink waybarPath;
  home.file.".config/rofi".source = config.lib.file.mkOutOfStoreSymlink rofiPath;
  home.file.".config/dunst".source = ../dunst;
  home.file.".config/wlogout".source = ../wlogout;
  home.file.".config/noctalia/settings.json".source = config.lib.file.mkOutOfStoreSymlink noctaliaConfigFile;
}
