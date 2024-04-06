{ config, pkgs, ... }:
{
programs.waybar = {
  enable = true;
  settings = {
   "mainBar" =  {
    "backlight"= {
      "device"= "intel_backlight";
      "format"= "{icon} {percent}%";
      "format-icons"= [
        ""
        ""
      ];
    };
    "tray"= {
        "icon-size"= 18;
        "spacing"= 10;
	"max-length"=50;
    };
    "battery"= {
      "format"= "{icon}  {capacity}%";
      "format-alt"= "{time} {icon}";
      "format-charging"= " {capacity}%";
      "format-icons"= [
        ""
        ""
        ""
        ""
        ""
      ];
      "format-plugged"= " {capacity}%";
      "states"= {
        "critical"= 20;
        "good"= 95;
        "warning"= 40;
      };
    };
    "network" = {
        "format-wifi"= " {essid} ({signalStrength}%) ";
        "format-ethernet"= "{ifname} ";
        "format-disconnected"= "";
        "max-length"= 50;
        "on-click"= "kitty -e 'nmtui'";
    };
    "clock"= {
      "format"= "{: %I:%M %p  %d/%m/%Y}";
    };
    "cpu"= {
      "format"= " {}%";
      "interval"= 15;
      "max-length"= 10;
      "on-click"= "kitty htop";
    };
    "hyprland/window"= {
      "format"= "{}";
      "max-length"= 35;
      "rewrite"= {
        "(.*) - Brave"= " [$1]";
        "(.*) - VSCodium"= " [$1]";
        "(.*) - bash"= "  [$1]";
        "(.*) — Mozilla Firefox"= "  $1";
      };
      "separate-outputs"= true;
    };
    "hyprland/workspaces"= {
      "format"= "{icon}";
      "format-icons"= {
        "1"= "";
        "2"= "";
        "3"= "";
        "4"= "";
        "5"= "";
      };
      "on-click"= "activate";
      "on-scroll-down"= "hyprctl dispatch workspace e-1";
      "on-scroll-up"= "hyprctl dispatch workspace e+1";
      "sort-by-number"= true;
    };
    "layer"= "top";
    "memory"= {
      "format"= " {}%";
      "interval"= 30;
      "max-length"= 10;
      "on-click"= "kitty htop";
    };
    "modules-center"= [
      "mpris"
      "hyprland/window"
    ];
    "modules-left"= [
      "hyprland/workspaces"
      "network"
      "cpu"
      "memory"
    ];
    "modules-right"= [
      "tray"
      "wireplumber"
      "backlight"
      "clock"
      "battery"
    ];
    "wireplumber"= {
        "format"= "{icon} {volume}% ";
        "format-muted"= "";
        "on-click"= "helvum";
        "format-icons"= ["" "" ""];
    };
    "mpris"= {
      "format"= "{player_icon} {dynamic}";
      "format-paused"= "{status_icon} <i>{dynamic}</i>";
      "max-length"= 25;
      "player-icons"= {
        "default"= "⏸";
        "mpv"= "🎵";
      };
      "status-icons"= {
        "paused"= "▶";
      };
    };
   };
  };

  
  style = '' 
  * {
	border: none;
	border-radius: 10px;
        font-family: "Noto Sans Mono CJK SC, Font Awesome 6 Free";
	font-size: 14px;
	min-height: 10px;
  }

  window#waybar {
	background: transparent;
  }

  window#waybar.hidden {
	opacity: 0.2;
  }


  #window {
	margin-top: 6px;
	padding-left: 10px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
        color: transparent;
	background: transparent;
  }
  #network {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #bd93f9;
  }

  #wireplumber {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #1A1826;
	background: #FAE3B0;
  }

  #battery {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #B5E8E0;
  }

  #battery.charging, #battery.plugged {
	color: #161320;
        background-color: #B5E8E0;
  }

  #battery.critical:not(.charging) {
    background-color: #B5E8E0;
    color: #161320;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  #clock {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 0px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #ABE9B3;
	/*background: #1A1826;*/
  }

  #memory {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #DDB6F2;
  }

  #cpu {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
	color: #161320;
	background: #96CDFB;
  }

  #tray {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;
	color: #B5E8E0;
	background: #c1b9dc;
  }

  #workspaces {
	margin-top: 6px;
	margin-left: 8px;
	padding-left: 10px;
	margin-bottom: 0px;
	padding-right: 10px;
	border-radius: 10px;
	transition: none;                                                                        
        color: #161320;
        background: #96CDFB;
  }

  #window {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        margin-bottom: 0px;
        padding-right: 10px;
        border-radius: 10px;
        transition: none;
        color: #9681dc;
        background: #2b2726;
  }

  #backlight {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        margin-bottom: 0px;
        padding-right: 10px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #96CDFB;
  }

  #mpris {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        margin-bottom: 0px;
        padding-right: 10px;
        border-radius: 10px;
        transition: none;
        color: #9681dc;
        background: #2b2726;
  }
  '';

 };

}
