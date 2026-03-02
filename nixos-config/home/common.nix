{ pkgs, ... }:{
  home.packages = with pkgs;[
    neofetch
    jq
    fzf
    zip
    unzip
    file
    which
    tree
    lsof
    killall
    pamixer
    dconf-editor
    libva
    libva-utils
    light
    blueman
  ];

  programs.kitty.enable = true;
}
