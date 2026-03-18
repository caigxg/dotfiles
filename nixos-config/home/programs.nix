{ pkgs, ... }:{
  home.packages = with pkgs;[
    vscode
    remmina
    wechat
    obsidian
    #gimp3
    mpv
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
