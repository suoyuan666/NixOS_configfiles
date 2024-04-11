{ config, pkgs, ... }:

{
  home.username = "zuos";
  home.homeDirectory = "/home/zuos";

  imports = [
    ./waybar.nix
    ./wofi.nix
    ./hyprland.nix
    ./theme.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs;[
    zip
    htop
    unzip
    p7zip
    kitty
    fastfetch
    xfce.thunar
    telegram-desktop
    amberol
    flatpak
    firefox
    yesplaymusic
    keepassxc
    bitwarden
    (
      (brave.override {
        commandLineArgs = [
          "--enable-wayland-ime"
          "--ozone-platform=wayland"
          "--enable-features=UseOzonePlatform"
          # "--use-gl=egl"
        ];
      }).overrideAttrs
      (old: {
        # inherit (pkgs.guangtao-sources.brave) src pname version;
      })
    )
  ];

  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
      "--enable-wayland-ime"
      "--ignore-gpu-blocklist"
    ];
    package = pkgs.ungoogled-chromium;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
    ];
  };
  
  
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

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Hack Nerd Font Mono";
      size = 14;
    };
  };
 
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
