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
    htop
    unzip
    p7zip
    lsd
    fd
    ripgrep
    fastfetch
    telegram-desktop
    amberol
    flatpak
    firefox
    keepassxc
    bitwarden
    (
      (brave.override {
        commandLineArgs = [
          "--enable-wayland-ime"
          "--ozone-platform=wayland"
          "--enable-features=UseOzonePlatform"
          # "--use-gl=egl"
        ];
      }).overrideAttrs
      (old: {
        # inherit (pkgs.guangtao-sources.brave) src pname version;
      })
    )
    tela-icon-theme
    netease-cloud-music-gtk
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
