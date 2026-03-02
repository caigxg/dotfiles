{ pkgs, ... }:{
  home.packages = with pkgs;[
    flclash
    vscode
    remmina
    #gimp3
    #mpv
    wechat
    #obsidian
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
