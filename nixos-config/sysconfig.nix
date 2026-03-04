{ config, pkgs,inputs, ... }:{
  imports =
    [
      ./hardware-configuration.nix
    ];
    
  nix.settings = {
     experimental-features = [ "nix-command" "flakes"];
     substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://cache.nixos.org/"
        "https://hyprland.cachix.org"
      ];
      
      # nix community's cache server
      extra-substituters = [
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];

      auto-optimise-store = true;
  };  

  #启用自动清理
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nixpkgs.config.allowUnfree = true;

  # Bootloader.

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5; #开机启动的grub条数
      };
      efi.canTouchEfiVariables = true;
    };

    kernelModules = [ 
      "i2c-dev"
    ];
  };



  hardware = {
    bluetooth = {
      enable = true; 
      powerOnBoot = true;
    };

    pulseaudio.enable = false;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      trustedInterfaces = [ "Mihomo" ];
      checkReversePath = false;
    };
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; #for hyprland
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    systemPackages = with pkgs; [
      util-linux
      vim-full
      ddcutil
      i2c-tools
      #lyra-cursors
    ];
  };


  services = {
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "caigx";
      sddm = {
        enable = true;
        wayland.enable = true;
        extraPackages = [ pkgs.sddm-sugar-dark ];
        theme = "sugar-dark";
      };
    };

    #切换显示器使用ddcutil时不用sudo
    udev.extraRules = ''
      SUBSYSTEM=="i2c-dev", KERNEL=="i2c-[0-9]*", MODE="0666", GROUP="users"
    '';

    #for noctalia-shell
    power-profiles-daemon.enable = true;
    upower.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    locate.enable = true;
    #xserver.enable = true;
    #xserver.videoDrivers = [ "amdgpu" ];
    printing.enable = true;  # Enable CUPS to print documents.
  };


  security = {
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
    polkit.enable = true; #for hyprland
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.noto
      nerd-fonts.jetbrains-mono
      wqy_zenhei
    ];
    fontconfig.enable = true;
  };

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  #desktop
  #services.desktopManager.plasma6.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };

  programs.clash-verge = {
    enable = true;
    tunMode = true;
    serviceMode = true;
  };

  users.users.caigx = {
    isNormalUser = true;
    description = "caigx";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "25.11";

}
