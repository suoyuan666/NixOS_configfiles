# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
	swtpm.enable = true;
	ovmf = {
          enable = true;
	  packages = [(pkgs.OVMF.override {
	    secureBoot = true;
	    tpmSupport = true;
          }).fd];
        };
      };
    };
  };
 
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
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

  boot.kernelParams = [
    "nouveau.modeset=0"
  ];

  zramSwap.enable = true;
  services.zram-generator.enable = true;

  hardware = {
    pulseaudio.enable = false;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        #nvidia-vaapi-driver
	intel-media-driver
      ];
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
	  Experimental = true;
	};
      };
    };
    #nvidia = {
    #modesetting.enable = true;
    #  powerManagement.enable = false;
    #  powerManagement.finegrained = false;
    #  open = false;
    #  nvidiaSettings = true;
    #  package = config.boot.kernelPackages.nvidiaPackages.stable;
    #};
  };

  # services.xserver = {
  #  videoDrivers = ["intel"];
  #  enable = true;
  #  displayManager.sddm = {
  #    enable = true;
  #  };
  #  # desktopManager.plasma5.enable = true;
  #};
  #services.desktopManager.plasma6.enable = true;

  networking.hostName = "OpenOS"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  networking.proxy.default = "http://127.0.0.1:20172";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
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
      LIBVA_DRIVER_NAME = "iHD"; 
      NIXOS_OZONE_WL = "1";
    };
    variables.EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    font-awesome
    hack-font
    (nerdfonts.override { fonts = [ "Hack" ]; })
    intel-one-mono
    wqy_zenhei
    wqy_microhei
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zuos = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" "video" 
      "docker" "libvirtd" 
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    ntfs3g
    swaybg
    imv
    playerctl # be used for waybar MPRIS
    waybar
    wofi
    brightnessctl
    pavucontrol
    virt-manager
  ];

  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
    };
  };

  programs.dconf.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.tlp.enable = true;
  services.v2raya.enable = true;

  services.blueman.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

