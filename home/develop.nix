{ config, pkgs, ... }:
{
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "ctrl:nocaps" ];
    };
    "org/gnome/mutter" = {
      experimental-features = [
        "scale-monitor-framebuffer"
        "xwayland-native-scaling"
        "autoclose-xwayland"
      ];
    };
  };

  programs.git = {
    enable = true;
    userName = "suoyuan666";
    userEmail = "suoyuan666@s5n.xyz";
  };
}
