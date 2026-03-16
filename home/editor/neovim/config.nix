{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.readFile ./nvim/init.lua;
  };

  xdg.configFile."nvim/lua" = {
    source = ./nvim/lua;
    recursive = true;
  };
}
