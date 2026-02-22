{ config, lib, ... }:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  systemd.coredump.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "OpenOS-v";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  networking.proxy.default = "http://192.168.122.1:38761";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

  services.xserver = {
    enable = true;
    videoDrivers = ["virtgl"];
  };
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
 
  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.zuosv = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    home = "/home/zuosv";
    hashedPasswordFile = "/persist/passwords/zuosv";
  };

   users.mutableUsers = false;

  environment.systemPackages = with pkgs; [
    neovim 
    wget
    git
    curl

    gnomeExtensions.blur-my-shell
  ];

  services.v2raya.enable = true;

  networking.firewall.allowedTCPPorts = [  ];
  networking.firewall.allowedUDPPorts = [  ];
  networking.firewall.enable = false;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
  };
}

