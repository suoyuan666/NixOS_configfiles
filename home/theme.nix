{ config, pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
    };

    font = {
      name = "Noto Sans Mono";
      size = 14;
    };
  };
}
