{ lib,pkgs,config, ... }:
let
  rimePath = "${config.home.homeDirectory}/nixos-config/home/fcitx5/rime";
in {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      kdePackages.fcitx5-chinese-addons
      fcitx5-rime
      fcitx5-gtk
      kdePackages.fcitx5-qt
      kdePackages.fcitx5-configtool
   ];
  };

  home.file.".local/share/fcitx5/rime".source = config.lib.file.mkOutOfStoreSymlink rimePath;


  home.sessionVariables = {
    #GTK_IM_MODULE = "fcitx5";
    #QT_IM_MODULE = "fcitx5";
    #XMODIFIERS = "@im=fcitx5";
    #FCITX_IM_MODULE = "fcitx5";
    FCITX5_ENABLE_WAYLAND = "1";
  };

}
