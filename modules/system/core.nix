{ config, lib, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    systemd-boot.enable = true;
  };

  networking.hostName = "OpenOS";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  networking.proxy.default = "http://127.0.0.1:38761";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  environment.systemPackages = with pkgs; [
    neovim 
    wget
    git
    curl

    gnomeExtensions.blur-my-shell
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-configtool
        fcitx5-gtk
    ];
  };

  environment = {
    sessionVariables = { 
      NIXOS_OZONE_WL = "1";
    };
    variables.EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    font-awesome
    nerd-fonts.hack
    intel-one-mono
    wqy_zenhei
    wqy_microhei
  ];


}
