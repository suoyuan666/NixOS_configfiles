{ ... }: {
  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ 
        "xwayland-native-scaling" 
        "scale-monitor-framebuffer" 
        "triple-buffering"
      ];
    };

    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "caps:escape" ];
    };

    "org/gnome/desktop/interface" = {
      font-antialiasing = "rgba";
    };

    "org/gnome/desktop/wm/preferences" = {
      edge-tiling = true;
    };
  };
}
