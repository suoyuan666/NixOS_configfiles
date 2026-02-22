{ config, lib, ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [  ];
    allowedUDPPorts = [  ];
  };
}
