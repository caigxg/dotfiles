{ pkgs, ... }:{
  home.packages = with pkgs;[
    thunar
    yazi
    vscode
    remmina
    wechat
    obsidian
    #gimp3
    mpv
    pandoc
    wpsoffice-cn
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
