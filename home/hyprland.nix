{ config, pkgs, ... }:

{

  services.mako = {
    enable = true;
  };

 home = {
    sessionVariables = { 
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      INPUT_METHOD = "fcitx";
      GLFW_IM_MODULE = "ibus";
    };
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$fileManager" = "thunar";
    "$menu" = "wofi --show drun";
    monitor = [  ",2560x1440@165,auto,1.4" ];
    exec-once = [
      "waybar"
      "mako"
      "fcitx5 -d"
      "swaybg -i \"/home/zuos/Pictures/landscape-rocks-6016x6016-11016.jpg\" -m fill"
    ];
    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
      workspace_swipe_numbered = true;
    };
    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
      # no_gaps_when_only = "yes";
    };
    general = {
      layout = "dwindle";
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
    };
    misc = {
      disable_splash_rendering = true;
      force_default_wallpaper = -1;
    };
    input = {
      kb_layout = "us";
      follow_mouse = 1;
      touchpad = {
        natural_scroll = "yes";
        disable_while_typing = true;
        drag_lock = true;
      };
      sensitivity = 0;
      float_switch_override_focus = 2;
    };
    decoration = {
      drop_shadow = "yes";
      shadow_range = 8;
      shadow_render_power = 2;
      "col.shadow" = "rgba(00000044)";

      dim_inactive = false;

      blur = {
        enabled = true;
        size = 5;
        passes = 1;
        new_optimizations = "on";
      };
    };
    animations = {
      enabled = "yes";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 5, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };
    bind = [
        "$mod, F, exec, firefox"
        "$mod, Q, exec, $terminal"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, R, exec, $menu"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
    );
  };

}
