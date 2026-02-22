{ config, lib, ... }:

{
  imports = [
    ./disk.nix
  ];

  boot.kernelParams = [
    "nouveau.modeset=0"
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "OpenOS";

  hardware.nvidia = {
    enabled = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = true;
    videoAcceleration = true; # default is true
    powerManagement.enable = true;
  };

  environment = {
    sessionVariables = { 
      LIBVA_DRIVER_NAME = "nvidia";
      NIXOS_OZONE_WL = "1";
    };
    persistence."/persist".users.zuos = {
      directories = [ "Downloads" "Documents" ".ssh" ".config/nixpkgs" ];
    };
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    v2raya.enable = true;

    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
    };
  };

  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
    };
  };

  users.users = {
    zuos = {
      isNormalUser = true;
      extraGroups = [ "wheel" "video" "docker" "libvirtd" ];
      home = "/home/zuos";
      hashedPasswordFile = "/persist/passwords/zuos";
    };
    mutableUsers = false;
  };
}

