{ config, lib, ... }:

{
  imports = [
    ./disk.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "OpenOS";
  networking.proxy.default = "http://127.0.0.1:38761";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  hardware.nvidia = {
    enabled = true;
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = true;
    videoAcceleration = true; # default is true
    nvidiaSettings = true;
    powerManagement.enable = true;
  };

  environment = {
    sessionVariables = { 
      LIBVA_DRIVER_NAME = "nvidia";
      NIXOS_OZONE_WL = "1";
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
    };
  };
}

