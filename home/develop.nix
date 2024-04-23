{ config, pkgs, ... }:
{
  programs.vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        yzhang.markdown-all-in-one
        pkief.material-icon-theme
        llvm-vs-code-extensions.vscode-clangd
        vadimcn.vscode-lldb
        usernamehw.errorlens
        astro-build.astro-vscode
        bbenoist.nix
        mshr-h.veriloghdl
        ms-python.python
      ];
      userSettings = {
         "window.titleBarStyle" = "custom";
         "editor.fontFamily" = "Intel One Mono";
         "editor.fontSize" = 17;
         "telemetry.telemetryLevel" = "off";
         "workbench.iconTheme" = "material-icon-theme";
         "workbench.colorTheme" = "Quiet Light";
      };
      package =
        (pkgs.vscodium.override
          {
            commandLineArgs = [
              "--ozone-platform-hint=auto"
              "--ozone-platform=wayland"
              "--use-gl=egl"
              "--enable-wayland-ime"
            ];
          });
   };



  programs.git = {
    enable = true;
    userName = "suoyuan666";
    userEmail = "107405806+suoyuan666@users.noreply.github.com";
  };
}
