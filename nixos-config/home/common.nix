{ pkgs, ... }:{
  home.packages = with pkgs;[
    fastfetch
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
    brightnessctl
    blueman
  ];

  programs.kitty.enable = true;
}
