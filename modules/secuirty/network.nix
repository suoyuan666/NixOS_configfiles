{ config, lib, ... }:
{
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [  ];
    allowedUDPPorts = [  ];
  };
}
