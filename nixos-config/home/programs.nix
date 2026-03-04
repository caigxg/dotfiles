{ pkgs, ... }:{
  home.packages = with pkgs;[
    #clash-verge-rev
    #clash-meta
    vscode
    remmina
    wechat
    obsidian
    #gimp3
    #mpv
    #wpsoffice-cn
    #libreoffice
    #android-tools
    #amule-gui
    #wine-wayland
  ];

  programs = {
    firefox.enable = true;
    chromium.enable = true;
  };

}
