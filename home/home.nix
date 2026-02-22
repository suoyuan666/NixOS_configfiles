{ config, pkgs, ... }:

{
  home.username = "zuos";
  home.homeDirectory = "/home/zuos";

  imports = [
    # ./waybar.nix
    # ./wofi.nix
    # ./hyprland.nix
    # ./theme.nix
    # ./hyprlock.nix
    ./develop.nix
    ./daily.nix
  ];

  home.packages = with pkgs;[
    zip
    unzip
    lsd
    fd
    ripgrep
    fastfetch
    amberol
    flatpak
    keepassxc
    tela-icon-theme
  ];

  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
      "--enable-wayland-ime"
      "--ignore-gpu-blocklist"
    ];
    package = pkgs.ungoogled-chromium;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
    ];
  };
  
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  # Let Home Manager install and manage itself.
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
