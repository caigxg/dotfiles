{ lib,pkgs,config, ... }:
let
  rimePath = "${config.home.homeDirectory}/nixos-config/home/fcitx5/rime";
in {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-chinese-addons
      fcitx5-rime
      fcitx5-gtk
      libsForQt5.fcitx5-qt
      qt6Packages.fcitx5-configtool
   ];
  };

  home.file.".local/share/fcitx5/rime".source = config.lib.file.mkOutOfStoreSymlink rimePath;


  home.sessionVariables = {
    #GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    FCITX_IM_MODULE = "fcitx";
    FCITX5_ENABLE_WAYLAND = "1";
  };

}
